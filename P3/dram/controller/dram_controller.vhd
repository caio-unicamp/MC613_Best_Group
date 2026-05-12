library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_controller is
    port (
        clk      : in    std_logic;
        rst      : in    std_logic;
        -- Interface com dram_iface
        address  : in    std_logic_vector(25 downto 0);
        data_in  : in    std_logic_vector(7 downto 0);  -- Dado vindo do iface (escrita)
        data_out : out   std_logic_vector(7 downto 0);  -- Dado enviado ao iface (leitura)
        req      : in    std_logic;
        wEn      : in    std_logic;
        ready    : out   std_logic;

        -- Interface Física SDRAM
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

    type state_type is (
        S_INIT_WAIT, S_INIT_PRECHARGE, S_INIT_REF_LOOP, S_INIT_LOAD_MODE, S_WAIT_MRD,
        S_IDLE,
        S_ACTIVATE, S_WAIT_RCD,
        S_READ_CMD, S_WAIT_CAS,
        S_WRITE_CMD, S_WAIT_DPL,
        S_PRECHARGE, S_WAIT_RP,
        S_REFRESH_CMD, S_WAIT_RC
    );
    signal state : state_type;

    -- Comandos (CS, RAS, CAS, WE)
    constant CMD_NOP : std_logic_vector(3 downto 0) := "0111";
    constant CMD_ACT : std_logic_vector(3 downto 0) := "0011";
    constant CMD_RD  : std_logic_vector(3 downto 0) := "0101";
    constant CMD_WR  : std_logic_vector(3 downto 0) := "0100";
    constant CMD_PRE : std_logic_vector(3 downto 0) := "0010";
    constant CMD_REF : std_logic_vector(3 downto 0) := "0001";
    constant CMD_MRS : std_logic_vector(3 downto 0) := "0000";

    -- Temporização (143 MHz)
    constant T_200US  : integer := 28600; 
    constant T_RCD    : integer := 3;  
    constant T_MRD    : integer := 3;
    constant T_CAS    : integer := 3; -- CAS Latency
    constant T_DPL    : integer := 2; -- tWR
    constant T_RP     : integer := 3;  
    constant T_RC     : integer := 10; -- tRFC
    constant T_REFI   : integer := 1100;

    signal sdram_cmd     : std_logic_vector(3 downto 0);
    signal delay_cnt     : integer range 0 to 32767;
    signal ref_init_cnt  : integer range 0 to 8;
    signal refresh_timer : integer range 0 to 1200;
    signal needs_refresh : boolean;

    signal req_addr : std_logic_vector(25 downto 0);
    signal req_data : std_logic_vector(7 downto 0);
    signal req_is_w : std_logic;

    -- Tri-state para o barramento de dados físico
    signal dq_out : std_logic_vector(7 downto 0);
    signal dq_oe  : std_logic; 

begin
    -- Port Mapping fixo
    dram_cs_n  <= sdram_cmd(3);
    dram_ras_n <= sdram_cmd(2);
    dram_cas_n <= sdram_cmd(1);
    dram_we_n  <= sdram_cmd(0);
    dram_cke   <= '1'; 
    dram_dqm   <= '0'; 

    -- Buffer Tri-state físico (Conecta ao chip)
    dram_dq <= dq_out when dq_oe = '1' else (others => 'Z');

    process(clk, rst)
    begin
        if rst = '0' then
            state <= S_INIT_WAIT;
            delay_cnt <= T_200US;
            ready <= '0';
            sdram_cmd <= CMD_NOP;
            dq_oe <= '0';
            needs_refresh <= false;
            refresh_timer <= T_REFI;
            ref_init_cnt <= 0;
            data_out <= (others => '0');

        elsif rising_edge(clk) then
            -- Default values
            sdram_cmd <= CMD_NOP;
            dq_oe <= '0';
            ready <= '0';
            
            -- Timer de Refresh (Só roda fora do reset/init)
            if state /= S_INIT_WAIT and state /= S_INIT_PRECHARGE and state /= S_INIT_REF_LOOP and state /= S_INIT_LOAD_MODE and state /= S_WAIT_MRD then
                if refresh_timer > 0 then
                    refresh_timer <= refresh_timer - 1;
                else
                    refresh_timer <= T_REFI;
                    needs_refresh <= true;
                end if;
            end if;

            case state is
                -- Sequência de Inicialização
                when S_INIT_WAIT =>
                    if delay_cnt > 0 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        state <= S_INIT_PRECHARGE;
                    end if;

                when S_INIT_PRECHARGE =>
                    sdram_cmd <= CMD_PRE;
                    dram_addr(10) <= '1'; -- All banks
                    delay_cnt <= T_RP;
                    ref_init_cnt <= 8;
                    state <= S_WAIT_RP;

                when S_INIT_REF_LOOP =>
                    sdram_cmd <= CMD_REF;
                    delay_cnt <= T_RC;
                    ref_init_cnt <= ref_init_cnt - 1;
                    state <= S_WAIT_RC;

                when S_INIT_LOAD_MODE =>
                    sdram_cmd <= CMD_MRS;
                    dram_ba <= "00";
                    -- CL=3, Sequential, Burst=1
                    dram_addr <= "000" & "0" & "00" & "011" & "0" & "000"; 
                    delay_cnt <= T_MRD;
                    state <= S_WAIT_MRD;
                
                when S_WAIT_MRD =>
                    if delay_cnt > 0 then delay_cnt <= delay_cnt - 1;
                    else state <= S_IDLE; end if;

                -- Estado de Repouso
                when S_IDLE =>
                    ready <= '1';
                    if needs_refresh then
                        ready <= '0';
                        state <= S_PRECHARGE;
                    elsif req = '1' then
                        ready <= '0';
                        req_addr <= address;
                        req_data <= data_in;
                        req_is_w <= wEn;
                        state <= S_ACTIVATE;
                    end if;

                -- Operação de Ativação de Linha
                when S_ACTIVATE =>
                    sdram_cmd <= CMD_ACT;
                    dram_ba   <= req_addr(25 downto 24);
                    dram_addr <= req_addr(23 downto 11);
                    delay_cnt <= T_RCD;
                    state <= S_WAIT_RCD;

                when S_WAIT_RCD =>
                    if delay_cnt > 0 then delay_cnt <= delay_cnt - 1;
                    else
                        if req_is_w = '1' then state <= S_WRITE_CMD;
                        else state <= S_READ_CMD; end if;
                    end if;

                -- Leitura
                when S_READ_CMD =>
                    sdram_cmd <= CMD_RD;
                    dram_ba <= req_addr(25 downto 24);
                    dram_addr <= '0' & req_addr(10) & '0' & req_addr(9 downto 0); 
                    delay_cnt <= T_CAS;
                    state <= S_WAIT_CAS;

                when S_WAIT_CAS =>
                    if delay_cnt > 0 then
                        delay_cnt <= delay_cnt - 1;
                    else
                        data_out <= dram_dq; -- Amostra o dado lido do chip
                        state <= S_PRECHARGE;
                    end if;

                -- Escrita
                when S_WRITE_CMD =>
                    sdram_cmd <= CMD_WR;
                    dram_ba <= req_addr(25 downto 24);
                    dram_addr <= '0' & req_addr(10) & '0' & req_addr(9 downto 0);
                    dq_out <= req_data;
                    dq_oe  <= '1'; -- Ativa driver para o chip
                    delay_cnt <= T_DPL;
                    state <= S_WAIT_DPL;

                when S_WAIT_DPL =>
                    dq_out <= req_data;
                    dq_oe  <= '1';
                    if delay_cnt > 0 then delay_cnt <= delay_cnt - 1;
                    else state <= S_PRECHARGE; end if;

                -- Fechamento de Linha (Precharge)
                when S_PRECHARGE =>
                    sdram_cmd <= CMD_PRE;
                    if needs_refresh then
                        dram_addr(10) <= '1';
                    else
                        dram_ba <= req_addr(25 downto 24);
                        dram_addr(10) <= '0';
                    end if;
                    delay_cnt <= T_RP;
                    state <= S_WAIT_RP;

                when S_WAIT_RP =>
                    if delay_cnt > 0 then delay_cnt <= delay_cnt - 1;
                    else
                        if needs_refresh then state <= S_REFRESH_CMD;
                        elsif ref_init_cnt > 0 then state <= S_INIT_REF_LOOP;
                        else state <= S_IDLE; end if;
                    end if;

                -- Refresh Periódico
                when S_REFRESH_CMD =>
                    sdram_cmd <= CMD_REF;
                    delay_cnt <= T_RC;
                    state <= S_WAIT_RC;

                when S_WAIT_RC =>
                    if delay_cnt > 0 then delay_cnt <= delay_cnt - 1;
                    else
                        if needs_refresh then
                            needs_refresh <= false;
                            state <= S_IDLE;
                        elsif ref_init_cnt > 0 then state <= S_INIT_REF_LOOP;
                        else state <= S_INIT_LOAD_MODE; end if;
                    end if;

                when others => state <= S_INIT_WAIT;
            end case;
        end if;
    end process;

end architecture;