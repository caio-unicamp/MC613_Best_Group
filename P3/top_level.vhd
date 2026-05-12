library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level is
    port (
        CLOCK_50 : in  std_logic;                    
        KEY      : in  std_logic_vector(3 downto 0); 
        SW       : in  std_logic_vector(9 downto 0); 
        
        -- Displays e LEDs
        HEX0     : out std_logic_vector(6 downto 0);
        HEX1     : out std_logic_vector(6 downto 0);
        HEX4     : out std_logic_vector(6 downto 0);
        HEX5     : out std_logic_vector(6 downto 0);
        LEDR     : out std_logic_vector(9 downto 8);
        
        -- Pinos Físicos da SDRAM
        DRAM_CLK   : out   std_logic; 
        DRAM_ADDR  : out   std_logic_vector(12 downto 0);
        DRAM_BA    : out   std_logic_vector(1 downto 0);
        DRAM_CAS_N : out   std_logic;
        DRAM_CKE   : out   std_logic;
        DRAM_CS_N  : out   std_logic;
        DRAM_DQM   : out   std_logic;
        DRAM_DQ    : inout std_logic_vector(7 downto 0);
        DRAM_RAS_N : out   std_logic;
        DRAM_WE_N  : out   std_logic
    );
end entity;

architecture rtl of top_level is

    -- Componentes
    component pll is
        port (
            refclk   : in  std_logic;
            rst      : in  std_logic;
            outclk_0 : out std_logic;
            outclk_1 : out std_logic;
            locked   : out std_logic
        );
    end component;

    component dram_iface is
        port (
            clk      : in  std_logic;
            rst      : in  std_logic;
            SW       : in  std_logic_vector(9 downto 0);
            KEY      : in  std_logic_vector(3 downto 0);
            ready    : in  std_logic;
            HEX0     : out std_logic_vector(6 downto 0);
            HEX1     : out std_logic_vector(6 downto 0);
            HEX4     : out std_logic_vector(6 downto 0);
            HEX5     : out std_logic_vector(6 downto 0);
            address  : out std_logic_vector(25 downto 0);
            data     : inout std_logic_vector(7 downto 0);
            req      : out std_logic;
            wEn      : out std_logic
        );
    end component;

    component dram_controller is
        port (
            clk        : in    std_logic;
            rst        : in    std_logic;
            address    : in    std_logic_vector(25 downto 0);
            data_in    : in    std_logic_vector(7 downto 0);  
            data_out   : out   std_logic_vector(7 downto 0);  
            req        : in    std_logic;
            wEn        : in    std_logic;
            ready      : out   std_logic;
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
    end component;

    -- Sinais Internos
    signal clk_143         : std_logic;
    signal clk_143_shifted : std_logic;
    signal pll_locked      : std_logic;
    signal sys_rst_n       : std_logic;

    signal ready_sig       : std_logic;
    signal req_sig         : std_logic;
    signal wEn_sig         : std_logic;
    signal addr_sig        : std_logic_vector(25 downto 0);
    
    signal data_bus        : std_logic_vector(7 downto 0);
    signal ctrl_data_out   : std_logic_vector(7 downto 0);

    -- Sinais para o LED de status
    signal led9_cnt        : unsigned(24 downto 0) := (others => '0');
    signal led9_on         : std_logic := '0';

begin

    inst_pll: pll
        port map (
            refclk   => CLOCK_50,
            rst      => not KEY(0),
            outclk_0 => clk_143,
            outclk_1 => clk_143_shifted,
            locked   => pll_locked
        );

    sys_rst_n <= KEY(0) and pll_locked;
    DRAM_CLK <= clk_143_shifted;

    -- Gerenciamento do Barramento de Dados Interno
    -- Leitura: iface recebe ctrl_data_out
    -- Escrita: iface coloca dado no barramento, controller lê via data_in
    data_bus <= ctrl_data_out when wEn_sig = '0' else (others => 'Z');

    inst_iface: dram_iface
        port map (
            clk      => clk_143,
            rst      => sys_rst_n,
            SW       => SW,
            KEY      => KEY,
            ready    => ready_sig,
            HEX0     => HEX0, HEX1 => HEX1, HEX4 => HEX4, HEX5 => HEX5,
            address  => addr_sig,
            data     => data_bus, 
            req      => req_sig,
            wEn      => wEn_sig
        );

    inst_controller: dram_controller
        port map (
            clk        => clk_143,
            rst        => sys_rst_n,
            address    => addr_sig,
            data_in    => data_bus,   
            data_out   => ctrl_data_out, 
            req        => req_sig,
            wEn        => wEn_sig,
            ready      => ready_sig,
            dram_addr  => DRAM_ADDR,
            dram_ba    => DRAM_BA,
            dram_cas_n => DRAM_CAS_N,
            dram_cke   => DRAM_CKE,
            dram_cs_n  => DRAM_CS_N,
            dram_dqm   => DRAM_DQM,
            dram_dq    => DRAM_DQ,
            dram_ras_n => DRAM_RAS_N,
            dram_we_n  => DRAM_WE_N
        );

    -- Debug Visual: LEDR(9) pisca em cada requisição, LEDR(8) indica escrita
    process(clk_143, sys_rst_n)
    begin
        if sys_rst_n = '0' then
            led9_cnt <= (others => '0');
            led9_on  <= '0';
        elsif rising_edge(clk_143) then
            if req_sig = '1' then
                led9_cnt <= to_unsigned(7000000, 25); -- ~50ms de brilho
                led9_on  <= '1';
            elsif led9_cnt > 0 then
                led9_cnt <= led9_cnt - 1;
                led9_on  <= '1';
            else
                led9_on  <= '0';
            end if;
        end if;
    end process;

    LEDR(9) <= led9_on;
    LEDR(8) <= wEn_sig;

end architecture;