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
        S_INIT_WAIT, S_INIT_PRECHARGE, S_INIT_REF_LOOP, S_INIT_LOAD_MODE, S_WAIT_MRD,
        S_IDLE,
        S_ACTIVATE, S_WAIT_RCD,
        S_READ_CMD, S_WAIT_CAS,
        S_WRITE_CMD, S_WAIT_DPL,
        S_PRECHARGE, S_WAIT_RP,
        S_REFRESH_CMD, S_WAIT_RC --tRFC
    );
    signal state : state_type;

    -- Constantes de Comandos (CS_n, RAS_n, CAS_n, WE_n)
    constant CMD_NOP : std_logic_vector(3 downto 0) := "0111";
    constant CMD_ACT : std_logic_vector(3 downto 0) := "0011";
    constant CMD_RD  : std_logic_vector(3 downto 0) := "0101";  -- read
    constant CMD_WR  : std_logic_vector(3 downto 0) := "0100";  -- write
    constant CMD_PRE : std_logic_vector(3 downto 0) := "0010";
    constant CMD_REF : std_logic_vector(3 downto 0) := "0001";
    constant CMD_MRS : std_logic_vector(3 downto 0) := "0000";

    -- Constantes de Temporização em nº de ciclos (Baseadas em 143 MHz -> T = ~7ns)
    constant T_200US  : integer := 28600; -- Espera para iniciar o INIT após RESET 
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
    signal ref_init_cnt  : integer range 0 to 8;   -- Contador de loops de refresh no INIT
    signal refresh_timer : integer range 0 to 1200; -- Contador para o refresh periódico
    signal needs_refresh : boolean; -- Flag para verificar se deve entrar em refresh

    -- Registradores de requisição
    signal req_addr : std_logic_vector(25 downto 0);    -- Organizado como BA = 25 downto 24(BA1 - BA0), ROW = 23 downto 11(A12 - A0), COL = 10(A11) + 9 downto 0(A9 - A0)
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
    dram_dqm <= '0'; 

    -- Lógica do buffer Tri-state para a porta INOUT
    dram_dq <= dq_out when dq_oe = '1' else (others => 'Z');

    process(clk, rst)
    begin
        if rst = '0' then -- Reset ativo em baixo (KEY(0))
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
            if refresh_timer > 0 then   -- Decrescente
                refresh_timer <= refresh_timer - 1;
            else
                refresh_timer <= T_REFI;
                if state /= S_INIT_WAIT and state /= S_INIT_PRECHARGE and state /= S_INIT_REF_LOOP and state /= S_INIT_LOAD_MODE and state /=S_WAIT_MRD then    -- Não precisa atualizar o timer do refresh se estiver em modo de INIT 
                    needs_refresh <= true;
                end if;
            end if;

            case state is
                -- INIT
                when S_INIT_WAIT =>
                    if delay_cnt > 2 then
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
                    dram_addr <= "000" & "1" & "00" & "011" & "0" & "000";  -- Segundo o datasheet
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

                    if needs_refresh then   -- Interrompe outros fluxos caso precise dar o refresh
                        ready <= '0';
                        state <= S_PRECHARGE;   -- O primeiro passo do refresh periódico: dar um precharge
                    elsif req = '1' then
                        ready <= '0';
                        req_addr <= address;
                        req_data <= data_in;
                        req_is_w <= wEn;
                        state <= S_ACTIVATE;
                    end if;

                -- ACTIVATE
                when S_ACTIVATE =>
                    sdram_cmd <= CMD_ACT;
                    -- Endereçamento hierárquico
                    dram_ba   <= req_addr(25 downto 24); -- Banco
                    dram_addr <= req_addr(23 downto 11);  -- Linha (Row)
                    delay_cnt <= T_RCD;
                    state <= S_WAIT_RCD;

                when S_WAIT_RCD =>
                    if delay_cnt > 2 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        if req_is_w = '1' then  -- Caso flag de write segue o fluxo de escrita
                            state <= S_WRITE_CMD;
                        else    -- Caso contrário segue o fluxo de leitura
                            state <= S_READ_CMD;
                        end if;
                    end if;

                -- READ
                when S_READ_CMD =>
                    sdram_cmd <= CMD_RD;
                    dram_ba <= req_addr(25 downto 24);  -- Mantém o banco
                    -- dram_addr tem 13 pinos. 
                    -- A12 don't care
                    -- A11 = req(10)
                    -- A10 = '0' para desativar Auto-Precharge automático
                    -- A9 até A0 recebem os 10 bits da coluna.
                    dram_addr <= '0' & req_addr(10) & '0' & req_addr(9 downto 0); 
                    delay_cnt <= T_CAS - 1;
                    state <= S_WAIT_CAS;

                when S_WAIT_CAS =>
                    if delay_cnt > 2 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        -- Captura o dado do barramento no momento exato (CL = 3)
                        data_out <= dram_dq;
                        state <= S_PRECHARGE;
                    end if;

                -- WRITE
                when S_WRITE_CMD =>
                    sdram_cmd <= CMD_WR;
                    dram_ba <= req_addr(25 downto 24);  -- Manté o banco
                    -- dram_addr tem 13 pinos. 
                    -- A12 don't care
                    -- A11 = req(10)
                    -- A10 = '0' para desativar Auto-Precharge automático
                    -- A9 até A0 recebem os 10 bits da coluna.
                    dram_addr <= '0' & req_addr(10) & '0' & req_addr(9 downto 0);
                    
                    -- Fornece o dado e habilita a saída Tri-state
                    dq_out <= req_data;
                    dq_oe  <= '1'; 
                    
                    delay_cnt <= T_DPL;
                    state <= S_WAIT_DPL;

                when S_WAIT_DPL =>
                    -- Mantém o dado sendo dirigido até o fim da recuperação
                    dq_out <= req_data;
                    dq_oe  <= '1';
                    if delay_cnt > 2 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        state <= S_PRECHARGE;
                    end if;

                -- PRECHARGE
                when S_PRECHARGE =>
                    sdram_cmd <= CMD_PRE;
                    if needs_refresh then   -- BA don't care (Precharge do refresh)
                        dram_addr(10) <= '1';   -- Abre todos os bancos para refresh
                    else    -- Precharge do READ/WRITE
                        dram_ba <= req_addr(25 downto 24);
                        dram_addr(10) <= '0'; -- Fecha apenas o banco ativo
                    end if;
                    delay_cnt <= T_RP;
                    state <= S_WAIT_RP;

                when S_WAIT_RP =>
                    if delay_cnt > 2 then   -- Decrementa o contador
                        delay_cnt <= delay_cnt - 1;
                    else
                        if needs_refresh then   -- Finaliza Precharge do refresh
                            state <= S_REFRESH_CMD;
                        elsif ref_init_cnt > 0 then
                            state <= S_INIT_REF_LOOP; -- Retorna para o Loop de Init
                        else    -- Precharge do READ/WRITE
                            state <= S_IDLE;
                        end if;
                    end if;

                -- REFRESH PERIÓDICO
                when S_REFRESH_CMD =>
                    sdram_cmd <= CMD_REF;
                    delay_cnt <= T_RC;
                    state <= S_WAIT_RC;

                when S_WAIT_RC =>
                    if delay_cnt > 2 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        if needs_refresh then
                            needs_refresh <= false; -- Reseta a flag
                            state <= S_IDLE;    -- Volta para ready
                        elsif ref_init_cnt > 0 then
                            state <= S_INIT_REF_LOOP; -- Volta no loop do refresh init até acabar a qtd correta
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