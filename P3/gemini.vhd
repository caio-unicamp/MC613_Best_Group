library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_controller is
    port (
        clk        : in    std_logic;
        rst        : in    std_logic;
        
        -- App
        req        : in    std_logic;
        rw         : in    std_logic; -- 1 Escrita, 0 Leitura
        addr       : in    std_logic_vector(24 downto 0);
        data_in    : in    std_logic_vector(15 downto 0);
        ack        : out   std_logic;
        data_out   : out   std_logic_vector(15 downto 0);
        valid      : out   std_logic;
        
        -- SDRAM
        DRAM_ADDR  : out   std_logic_vector(12 downto 0);
        DRAM_BA    : out   std_logic_vector(1 downto 0);
        DRAM_CAS_N : out   std_logic;
        DRAM_CKE   : out   std_logic;
        DRAM_CS_N  : out   std_logic;
        DRAM_DQ    : inout std_logic_vector(15 downto 0);
        DRAM_LDQM  : out   std_logic;
        DRAM_RAS_N : out   std_logic;
        DRAM_UDQM  : out   std_logic;
        DRAM_WE_N  : out   std_logic
    );
end dram_controller;

architecture rtl of dram_controller is

    type state_type is (INIT, PRECHARGE_ALL, REFRESH1, REFRESH2, MODE_REG, 
                        IDLE, ACTIVATE, READ_CMD, WRITE_CMD, WAIT_CAS, PRECHARGE_ROW);
    signal state : state_type;

    signal counter : integer range 0 to 10000;
    
    signal oe           : std_logic;
    signal data_write   : std_logic_vector(15 downto 0);

    -- Comandos da memória (RAS_N, CAS_N, WE_N)
    constant CMD_NOP : std_logic_vector(2 downto 0) := "111";
    constant CMD_PRE : std_logic_vector(2 downto 0) := "010";
    constant CMD_REF : std_logic_vector(2 downto 0) := "001";
    constant CMD_MRS : std_logic_vector(2 downto 0) := "000";
    constant CMD_ACT : std_logic_vector(2 downto 0) := "011";
    constant CMD_RD  : std_logic_vector(2 downto 0) := "101";
    constant CMD_WR  : std_logic_vector(2 downto 0) := "100";

    signal cmd : std_logic_vector(2 downto 0);

begin

    -- Sinais Físicos Constantes
    DRAM_CKE  <= '1';
    DRAM_CS_N <= '0';
    DRAM_LDQM <= '0';  -- Máscaras zeradas para sempre permitir o dado
    DRAM_UDQM <= '0';

    -- Atribuição Concorrente do Barramento Bidirecional (O Segredo para ler os dados)
    DRAM_DQ <= data_write when (oe = '1') else (others => 'Z');

    -- Mapeamento do Comando
    DRAM_RAS_N <= cmd(2);
    DRAM_CAS_N <= cmd(1);
    DRAM_WE_N  <= cmd(0);

    process(clk, rst)
    begin
        if rst = '1' then
            state      <= INIT;
            counter    <= 0;
            cmd        <= CMD_NOP;
            DRAM_ADDR  <= (others => '0');
            DRAM_BA    <= "00";
            oe         <= '0';
            ack        <= '0';
            valid      <= '0';
        elsif rising_edge(clk) then
            -- Default
            cmd   <= CMD_NOP;
            ack   <= '0';
            valid <= '0';
            oe    <= '0';
            
            case state is
                when INIT =>
                    -- Espera 200us (aprox 30000 ciclos @ 143MHz, ou simplificado)
                    if counter < 30000 then
                        counter <= counter + 1;
                    else
                        state <= PRECHARGE_ALL;
                        counter <= 0;
                    end if;

                when PRECHARGE_ALL =>
                    cmd <= CMD_PRE;
                    DRAM_ADDR(10) <= '1'; -- All banks
                    state <= REFRESH1;

                when REFRESH1 =>
                    if counter = 3 then -- tRP
                        cmd <= CMD_REF;
                        state <= REFRESH2;
                        counter <= 0;
                    else
                        counter <= counter + 1;
                    end if;

                when REFRESH2 =>
                    if counter = 10 then -- tRFC
                        cmd <= CMD_REF;
                        state <= MODE_REG;
                        counter <= 0;
                    else
                        counter <= counter + 1;
                    end if;

                when MODE_REG =>
                    if counter = 10 then
                        cmd <= CMD_MRS;
                        -- CAS = 3, Burst = 1
                        DRAM_ADDR <= "0000000110000"; 
                        DRAM_BA <= "00";
                        state <= IDLE;
                        counter <= 0;
                    else
                        counter <= counter + 1;
                    end if;

                when IDLE =>
                    if counter = 3 then -- tMRD
                        if req = '1' then
                            state <= ACTIVATE;
                        end if;
                    else
                        counter <= counter + 1;
                    end if;

                when ACTIVATE =>
                    cmd <= CMD_ACT;
                    DRAM_BA <= addr(24 downto 23);
                    DRAM_ADDR <= addr(22 downto 10); -- Row
                    state <= READ_CMD; -- Generico, decide no tRCD
                    counter <= 0;

                when READ_CMD =>
                    if counter = 3 then -- tRCD
                        DRAM_BA <= addr(24 downto 23);
                        DRAM_ADDR <= "000" & addr(9 downto 0); -- Coluna
                        
                        if rw = '1' then
                            cmd <= CMD_WR;
                            oe <= '1';
                            data_write <= data_in;
                            ack <= '1';
                            state <= PRECHARGE_ROW;
                        else
                            cmd <= CMD_RD;
                            state <= WAIT_CAS;
                            counter <= 0;
                        end if;
                    else
                        counter <= counter + 1;
                    end if;

                when WAIT_CAS =>
                    if counter = 2 then -- CAS Latency = 3 (-1 ciclo do state_machine)
                        data_out <= DRAM_DQ; -- Amostra o dado
                        valid <= '1';
                        ack <= '1';
                        state <= PRECHARGE_ROW;
                    else
                        counter <= counter + 1;
                    end if;

                when PRECHARGE_ROW =>
                    cmd <= CMD_PRE;
                    DRAM_ADDR(10) <= '0';
                    DRAM_BA <= addr(24 downto 23);
                    state <= IDLE;
                    counter <= 0;

            end case;
        end if;
    end process;

end rtl;