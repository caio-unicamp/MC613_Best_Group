library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level is
    port (
        CLOCK_50 : in  std_logic;                    -- Clock principal da placa
        KEY      : in  std_logic_vector(3 downto 0); -- Botões
        SW       : in  std_logic_vector(9 downto 0); -- Chaves
        
        -- Displays e LEDs
        HEX0     : out std_logic_vector(6 downto 0);
        HEX1     : out std_logic_vector(6 downto 0);
        HEX4     : out std_logic_vector(6 downto 0);
        HEX5     : out std_logic_vector(6 downto 0);
        LEDR     : out std_logic_vector(9 downto 0);
        
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
    signal ready_sig : std_logic;
    signal req_sig   : std_logic;
    signal wEn_sig   : std_logic;
    signal addr_sig  : std_logic_vector(25 downto 0);
    
    -- Barramentos de dados internos
    signal data_bus      : std_logic_vector(7 downto 0); -- Fio bidirecional ligado na iface
    signal ctrl_data_out : std_logic_vector(7 downto 0); -- Fio que sai do controller para a iface

    -- Sinais para o "esticador de pulso" dos LEDs
    signal led9_cnt : integer range 0 to 5000000 := 0;
    signal led9_on  : std_logic := '0';

begin

    -- Envia o clock da placa diretamente para o chip SDRAM
    DRAM_CLK <= CLOCK_50;

    -- =========================================================================
    -- Lógica do Barramento Interno (Tri-State)
    -- =========================================================================
    -- Quando o iface quer LER (wEn = '0'), o top_level pega a saída (data_out)
    -- do dram_controller e joga no data_bus para o iface conseguir ler.
    -- Quando o iface quer ESCREVER, deixamos em alta impedância ('Z') para que o próprio
    -- iface assuma o controle do data_bus e empurre o dado para dentro do controller.
    data_bus <= ctrl_data_out when wEn_sig = '0' else (others => 'Z');

    -- =========================================================================
    -- Instanciação do dram_iface (Seu painel de controle)
    -- =========================================================================
    inst_iface: dram_iface
        port map (
            clk      => CLOCK_50,
            rst      => KEY(0),    -- Reset ativo em baixo conectado diretamente!
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
    -- Instanciação do dram_controller (O cérebro da memória)
    -- =========================================================================
    inst_controller: dram_controller
        port map (
            clk        => CLOCK_50,
            rst        => KEY(0),  -- Reset ativo em baixo conectado diretamente!
            address    => addr_sig,
            
            -- data_bus contém o valor que o iface quer escrever
            data_in    => data_bus,    
            -- ctrl_data_out recebe o valor que o controller leu da memória
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

    -- =========================================================================
    -- Debug Visual
    -- =========================================================================
    
    -- Esticador de pulso para ver o LED de requisição piscando
    process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then
            if req_sig = '1' then
                led9_cnt <= 5000000;
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
    
    -- Exibe o tráfego do barramento de dados nos LEDs [7:0]
    LEDR(7 downto 0) <= data_bus;

end rtl;