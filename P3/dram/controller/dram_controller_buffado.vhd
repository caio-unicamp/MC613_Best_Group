library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_controller is
    port (
        clk      : in    std_logic;
        rst      : in    std_logic;
        -- Interface com dram_iface
        address  : in    std_logic_vector(25 downto 0);
        data_in  : in    std_logic_vector(7 downto 0);  -- Dado a ser lido
        data_out : out   std_logic_vector(7 downto 0);  -- Dado a ser escrito
        req      : in    std_logic;
        wEn      : in    std_logic;
        ready    : out   std_logic;

        -- Interface Física SDRAM para 64MX8
        dram_addr  : out   std_logic_vector(12 downto 0);
        dram_ba    : out   std_logic_vector(1 downto 0);
        dram_cas_n : out   std_logic;
        dram_cke   : out   std_logic;
        dram_cs_n  : out   std_logic;
        dram_dqm   : out   std_logic;    
        dram_dq    : inout std_logic_vector(7 downto 0)
        dram_ras_n : out   std_logic;    
        dram_we_n  : out   std_logic;
    );
end entity;

architecture rtl of dram_controller is

    -- Definição dos Estados da FSM
    type state_type is (
        S_INIT_WAIT, S_INIT_PRECHARGE, S_INIT_REF_LOOP, S_INIT_LOAD_MODE,
        S_IDLE,
        S_ACTIVATE, S_WAIT_RCD,
        S_READ_CMD, S_WAIT_CAS,
        S_WRITE_CMD, S_WAIT_DPL,
        S_PRECHARGE, S_WAIT_RP,
        S_REFRESH_CMD, S_WAIT_RFC
    );
    signal state : state_type;

    -- Constantes de Comandos (CS_n, RAS_n, CAS_n, WE_n)
    constant CMD_NOP : std_logic_vector(3 downto 0) := "0111";
    constant CMD_ACT : std_logic_vector(3 downto 0) := "0011";
    constant CMD_RD  : std_logic_vector(3 downto 0) := "0101";
    constant CMD_WR  : std_logic_vector(3 downto 0) := "0100";
    constant CMD_PRE : std_logic_vector(3 downto 0) := "0010";
    constant CMD_REF : std_logic_vector(3 downto 0) := "0001";
    constant CMD_MRS : std_logic_vector(3 downto 0) := "0000";

    -- Constantes de Temporização (Baseadas em 143 MHz -> T = ~7ns)
    constant T_200US  : integer := 28600; -- Ciclos para 200us
    constant T_RCD    : integer := 2;     -- tRCD = 15ns (~2 a 3 ciclos)
    constant T_CAS    : integer := 3;     -- CL = 3 ciclos
    constant T_DPL    : integer := 2;     -- tWR/tDPL após escrita
    constant T_RP     : integer := 2;     -- tRP = 15ns
    constant T_RFC    : integer := 9;     -- tRC = 60ns (~9 ciclos)
    constant T_REFI   : integer := 1100;  -- Intervalo de refresh (~7.8us)

    -- Sinais Internos
    signal sdram_cmd     : std_logic_vector(3 downto 0);
    signal delay_cnt     : integer range 0 to 32767;
    signal ref_init_cnt  : integer range 0 to 15;
    signal refresh_timer : integer range 0 to 2047;
    signal needs_refresh : boolean;

    -- Registradores de requisição
    signal req_addr : std_logic_vector(25 downto 0);
    signal req_data : std_logic_vector(7 downto 0);
    signal req_is_w : std_logic;

    -- Controle do Tri-state do Barramento de Dados
    signal dq_out : std_logic_vector(7 downto 0);
    signal dq_oe  : std_logic; -- Output Enable

begin

    -- Mapeamento dos pinos de comando
    dram_cs_n  <= sdram_cmd(3);
    dram_ras_n <= sdram_cmd(2);
    dram_cas_n <= sdram_cmd(1);
    dram_we_n  <= sdram_cmd(0);
    
    dram_cke <= '1'; -- Clock Enable sempre ativo
    dram_dqm <= '0'; -- Não estamos usando máscara de dados neste projeto

    -- Lógica do buffer Tri-state para a porta INOUT
    dram_dq <= dq_out when dq_oe = '1' else (others => 'Z');

    process(clk, rst)
    begin
        if rst = '0' then -- Assumindo reset ativo em baixo (KEY(0))
            state <= S_INIT_WAIT;
            delay_cnt <= T_200US;
            ready <= '0';
            sdram_cmd <= CMD_NOP;
            dq_oe <= '0';
            needs_refresh <= false;
            refresh_timer <= T_REFI;
            dram_ba <= "00";
            dram_addr <= (others => '0');

        elsif rising_edge(clk) then
            -- Valores Padrão por Ciclo
            sdram_cmd <= CMD_NOP;
            dq_oe <= '0';
            ready <= '0';

            -- Temporizador de Refresh Automático
            if state /= S_INIT_WAIT then
                if refresh_timer > 0 then
                    refresh_timer <= refresh_timer - 1;
                else
                    needs_refresh <= true;
                    refresh_timer <= T_REFI;
                end if;
            end if;

            case state is
                -- ==========================================
                -- FLUXO DE INICIALIZAÇÃO (INIT)
                -- ==========================================
                when S_INIT_WAIT =>
                    if delay_cnt > 0 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        state <= S_INIT_PRECHARGE;
                    end if;

                when S_INIT_PRECHARGE =>
                    sdram_cmd <= CMD_PRE;
                    dram_addr(10) <= '1'; -- A10 em 1 = Precharge ALL Banks
                    delay_cnt <= T_RP;
                    ref_init_cnt <= 8; -- O Datasheet pede no mínimo 2 ciclos de Auto Refresh, 8 é o padrão seguro
                    state <= S_WAIT_RP;

                when S_INIT_REF_LOOP =>
                    sdram_cmd <= CMD_REF;
                    delay_cnt <= T_RFC;
                    ref_init_cnt <= ref_init_cnt - 1;
                    state <= S_WAIT_RFC;

                when S_INIT_LOAD_MODE =>
                    sdram_cmd <= CMD_MRS;
                    -- Configuração Mode Register: Burst=1, Sequential, CL=3
                    dram_ba <= "00";
                    dram_addr <= "000" & "0" & "00" & "011" & "0" & "000";
                    delay_cnt <= T_RCD; -- Espera genérica pós-LMR
                    state <= S_WAIT_RCD;

                -- ==========================================
                -- ESTADO OCIOSO (READY)
                -- ==========================================
                when S_IDLE =>
                    ready <= '1'; -- Sinaliza ao dram_iface que está livre

                    if needs_refresh then
                        ready <= '0';
                        needs_refresh <= false;
                        state <= S_REFRESH_CMD;
                    elsif req = '1' then
                        ready <= '0';
                        req_addr <= address;
                        req_data <= data_in;
                        req_is_w <= wEn;
                        state <= S_ACTIVATE;
                    end if;

                -- ==========================================
                -- FLUXOS DE ACESSO (ACTIVATE COMPARTILHADO)
                -- ==========================================
                when S_ACTIVATE =>
                    sdram_cmd <= CMD_ACT;
                    -- Endereçamento hierárquico
                    dram_ba   <= req_addr(23 downto 22); -- Banco
                    dram_addr <= req_addr(21 downto 9);  -- Linha (Row)
                    delay_cnt <= T_RCD;
                    state <= S_WAIT_RCD;

                when S_WAIT_RCD =>
                    if delay_cnt > 0 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        if req_is_w = '1' then
                            state <= S_WRITE_CMD;
                        else
                            state <= S_READ_CMD;
                        end if;
                    end if;

                -- ==========================================
                -- FLUXO DE LEITURA (READ)
                -- ==========================================
                when S_READ_CMD =>
                    sdram_cmd <= CMD_RD;
                    dram_ba <= req_addr(23 downto 22);
                    -- A10 = '0' para desativar Auto-Precharge automático
                    dram_addr <= "0000" & '0' & req_addr(8 downto 1) & req_addr(0); 
                    delay_cnt <= T_CAS - 1;
                    state <= S_WAIT_CAS;

                when S_WAIT_CAS =>
                    if delay_cnt > 0 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        -- Captura o dado do barramento no momento exato (CL = 3)
                        data_out <= dram_dq;
                        state <= S_PRECHARGE;
                    end if;

                -- ==========================================
                -- FLUXO DE ESCRITA (WRITE)
                -- ==========================================
                when S_WRITE_CMD =>
                    sdram_cmd <= CMD_WR;
                    dram_ba <= req_addr(23 downto 22);
                    dram_addr <= "0000" & '0' & req_addr(8 downto 1) & req_addr(0);
                    
                    -- Fornece o dado e habilita a saída Tri-state
                    dq_out <= req_data;
                    dq_oe  <= '1'; 
                    
                    delay_cnt <= T_DPL;
                    state <= S_WAIT_DPL;

                when S_WAIT_DPL =>
                    -- Mantém o dado sendo dirigido até o fim da recuperação
                    dq_out <= req_data;
                    dq_oe  <= '1';
                    if delay_cnt > 0 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        state <= S_PRECHARGE;
                    end if;

                -- ==========================================
                -- PRECHARGE (COMPARTILHADO)
                -- ==========================================
                when S_PRECHARGE =>
                    sdram_cmd <= CMD_PRE;
                    dram_ba <= req_addr(23 downto 22);
                    dram_addr(10) <= '0'; -- Fecha apenas o banco ativo
                    delay_cnt <= T_RP;
                    state <= S_WAIT_RP;

                when S_WAIT_RP =>
                    if delay_cnt > 0 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        if ref_init_cnt > 0 then
                            state <= S_INIT_REF_LOOP; -- Retorna para o Loop de Init
                        else
                            state <= S_IDLE; -- Retorna para Idle na operação normal
                        end if;
                    end if;

                -- ==========================================
                -- REFRESH PERIÓDICO (CBR / AUTO-REFRESH)
                -- ==========================================
                when S_REFRESH_CMD =>
                    sdram_cmd <= CMD_REF;
                    delay_cnt <= T_RFC;
                    state <= S_WAIT_RFC;

                when S_WAIT_RFC =>
                    if delay_cnt > 0 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        if ref_init_cnt > 0 then
                            state <= S_INIT_LOAD_MODE; -- Segue o fluxo de Init
                        else
                            state <= S_IDLE;
                        end if;
                    end if;

                when others =>
                    state <= S_INIT_WAIT;
            end case;
        end if;
    end process;

end architecture;