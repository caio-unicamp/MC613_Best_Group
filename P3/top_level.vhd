library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level is
    port (
        CLOCK_50 : in  std_logic;                    -- Clock principal da placa (50 MHz)
        KEY      : in  std_logic_vector(3 downto 0); -- Botões
        SW       : in  std_logic_vector(9 downto 0); -- Chaves
        
        -- Displays e LEDs
        HEX0     : out std_logic_vector(6 downto 0);
        HEX1     : out std_logic_vector(6 downto 0);
        HEX4     : out std_logic_vector(6 downto 0);
        HEX5     : out std_logic_vector(6 downto 0);
        LEDR     : out std_logic_vector(9 downto 8);
        
        -- =========================================================
        -- Pinos Físicos da SDRAM (Conectam-se ao chip na placa)
        -- =========================================================
        DRAM_CLK   : out   std_logic; -- Clock enviado para a memória
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
end top_level;

architecture rtl of top_level is

    -- =========================================================================
    -- Declaração dos Componentes
    -- =========================================================================
    
    -- Componente do PLL (Você deve gerar este IP no Quartus)
    component pll is
        port (
            refclk   : in  std_logic; -- Entrada: 50 MHz
            rst      : in  std_logic; -- Reset do PLL (Geralmente ativo em ALTO)
            outclk_0 : out std_logic; -- Saída: 143 MHz
            locked   : out std_logic  -- '1' quando a frequência estiver estabilizada
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

    -- =========================================================================
    -- Sinais Internos
    -- =========================================================================
    
    -- Sinais de Clock e Reset
    signal clk_143    : std_logic;
    signal pll_locked : std_logic;
    signal sys_rst_n  : std_logic; -- Reset global (ativo em BAIXO)

    -- Sinais de Controle
    signal ready_sig : std_logic;
    signal req_sig   : std_logic;
    signal wEn_sig   : std_logic;
    signal addr_sig  : std_logic_vector(25 downto 0);
    
    -- Barramentos de dados internos
    signal data_bus      : std_logic_vector(7 downto 0);
    signal ctrl_data_out : std_logic_vector(7 downto 0);

begin

    -- =========================================================================
    -- Instanciação do PLL e Lógica de Reset
    -- =========================================================================
    
    -- A maioria dos IPs de PLL da Altera espera um reset ativo em ALTO.
    -- Como KEY(0) é ativo em BAIXO, invertemos o sinal para resetar o PLL.
    inst_pll: pll
        port map (
            refclk   => CLOCK_50,
            rst      => not KEY(0),
            outclk_0 => clk_143,
            locked   => pll_locked
        );

    -- O reset do sistema só libera ('1') quando o botão não estiver pressionado AND o PLL estiver travado.
    sys_rst_n <= KEY(0) and pll_locked;

    -- O clock gerado pelo PLL agora alimenta diretamente o chip físico da SDRAM
    DRAM_CLK <= clk_143;

    -- =========================================================================
    -- Lógica do Barramento Interno (Tri-State)
    -- =========================================================================
    data_bus <= ctrl_data_out when wEn_sig = '0' else (others => 'Z');

    -- =========================================================================
    -- Instanciação do dram_iface
    -- =========================================================================
    inst_iface: dram_iface
        port map (
            clk      => clk_143,     -- Atualizado para o novo clock
            rst      => sys_rst_n,   -- Reset sincronizado com o PLL
            SW       => SW,
            KEY      => KEY,
            ready    => ready_sig,
            HEX0     => HEX0,
            HEX1     => HEX1,
            HEX4     => HEX4,
            HEX5     => HEX5,
            address  => addr_sig,
            data     => data_bus,
            req      => req_sig,
            wEn      => wEn_sig
        );

    -- =========================================================================
    -- Instanciação do dram_controller
    -- =========================================================================
    inst_controller: dram_controller
        port map (
            clk        => clk_143,    -- Atualizado para o novo clock
            rst        => sys_rst_n,  -- Reset sincronizado com o PLL
            address    => addr_sig,
            data_in    => data_bus,    
            data_out   => ctrl_data_out, 
            req        => req_sig,
            wEn        => wEn_sig,
            ready      => ready_sig,
            
            -- Pinos físicos SDRAM
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

    LEDR(9) <= req_sig;
    LEDR(8) <= wEn_sig;

end rtl;