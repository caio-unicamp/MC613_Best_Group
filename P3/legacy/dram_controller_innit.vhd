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
        dram_dq    : inout std_logic_vector(7 downto 0);
        dram_ras_n : out   std_logic;    
        dram_we_n  : out   std_logic
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
        S_REFRESH_CMD, S_WAIT_RC, S_WAIT_MRD
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
    constant T_200US  : integer := 100; -- Ciclos para 200us
    constant T_RCD    : integer := 2;     -- tRCD = 15ns (~2 a 3 ciclos)
    constant T_MRD    : integer := 2;     -- tMRD = 14ns (~2 a 3 ciclos)
    constant T_CAS    : integer := 3;     -- CL = 3 ciclos
    constant T_DPL    : integer := 2;     -- tWR/tDPL após escrita
    constant T_RP     : integer := 2;     -- tRP = 15ns (~2 a 3 ciclos)
    constant T_RC    : integer := 9;     -- tRC(ou tRFC) = 60ns (~9 ciclos)
    constant T_REFI   : integer := 1100;  -- Intervalo de refresh (~7.8us = 1114 ciclos de clock/o maior tempo entre READ e WRITE são 7 ciclos de clock, tirando o dobro fica 1100 ciclos para não ter perigo de interromper um outro fluxo)

    -- Sinais Internos
    signal sdram_cmd     : std_logic_vector(3 downto 0);
    signal delay_cnt     : integer range 0 to 32767;
    signal ref_init_cnt  : integer range 0 to 15;   -- Contador de loops de refresh no INIT
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
            refresh_timer <= T_REFI;
            dram_ba <= "00";
            dram_addr <= (others => '0');

        elsif rising_edge(clk) then
            -- Valores Padrão por Ciclo
            sdram_cmd <= CMD_NOP;
            ready <= '0';

            case state is
                -- INIT
                when S_INIT_WAIT =>
                    if delay_cnt > 0 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        state <= S_INIT_PRECHARGE;
                    end if;

                when S_INIT_PRECHARGE =>
                    sdram_cmd <= CMD_PRE;
                    dram_addr(10) <= '1'; -- A10 em 1 = Precharge ALL Banks
                    delay_cnt <= T_RP;  -- Espera Trp entre PRECHARGE e AUTO_REFRESH
                    ref_init_cnt <= 8; -- Vai fazer o AUTO_REFRESH 8 vezes
                    state <= S_WAIT_RP;

                when S_INIT_REF_LOOP => -- Loop do refresh do INIT
                    sdram_cmd <= CMD_REF;
                    delay_cnt <= T_RC;
                    ref_init_cnt <= ref_init_cnt - 1;
                    state <= S_WAIT_RC;

                when S_INIT_LOAD_MODE =>
                    sdram_cmd <= CMD_MRS;
                    -- Configuração Mode Register: Burst_length=1, Burst_type=Sequential, CL=3, Operating_mode =Standard, Write_Burst_Mode=Single Location Access
                    -- Seguindo nosso querido datasheet, garantindo compatibilidade com dispositivos futuros deve-se ter BA1, BA0, A12, A11,A10 = 0
                    dram_ba <= "00";
                    dram_addr <= "000" & "1" & "00" & "011" & "0" & "000";
                    delay_cnt <= T_MRD; 
                    state <= S_WAIT_MRD;
                
                when S_WAIT_MRD =>
                    if delay_cnt > 2 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        state <= S_IDLE;
                    end if;

                -- READY
                when S_IDLE =>
                    ready <= '1'; -- Sinaliza ao dram_iface que está livre

                -- ==========================================
                -- PRECHARGE 
                -- ==========================================

                when S_WAIT_RP =>
                    if delay_cnt > 2 then
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

                when S_WAIT_RC =>
                    if delay_cnt > 2 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        if ref_init_cnt > 0 then
                            state <= S_INIT_REF_LOOP; -- Volta no loop até acabar a qtd correta
                        else
                            state <= S_INIT_LOAD_MODE;  -- Quando acabar os loops segue para o Load Mode Register
                        end if;
                    end if;

                when others =>
                    state <= S_INIT_WAIT;
            end case;
        end if;
    end process;

end architecture;