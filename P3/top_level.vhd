library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level is
    port (
        CLOCK_50 : in  std_logic;                    -- Clock principal da placa
        KEY      : in  std_logic_vector(3 downto 0); -- Botões
        SW       : in  std_logic_vector(9 downto 0); -- Chaves
        HEX0     : out std_logic_vector(6 downto 0);
        HEX1     : out std_logic_vector(6 downto 0);
        HEX4     : out std_logic_vector(6 downto 0);
        HEX5     : out std_logic_vector(6 downto 0);
        LEDR     : out std_logic_vector(9 downto 0)  -- LEDs para debug
    );
end top_level;

architecture rtl of top_level is

    -- Declaração do seu módulo dram_iface
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

    -- Sinais internos para interligar os módulos
    signal rst_sig   : std_logic;
    signal ready_sig : std_logic;
    signal req_sig   : std_logic;
    signal wEn_sig   : std_logic;
    signal addr_sig  : std_logic_vector(25 downto 0);
    signal data_bus  : std_logic_vector(7 downto 0);
    
    -- =========================================================================
    -- DUMMY RAM PARA TESTE
    -- Cria uma pequena memória de 64 posições para simular a DRAM
    -- =========================================================================
    type ram_type is array (0 to 63) of std_logic_vector(7 downto 0);
    signal fake_ram  : ram_type := (others => x"00");
    signal read_data : std_logic_vector(7 downto 0);
    signal ram_index : integer range 0 to 63;

begin

    -- O botão KEY(0) é ativo em '0' (pressionado = 0).
    -- Sua dram_iface espera um rst ativo em '1'. Por isso, invertemos o sinal.
    rst_sig <= not KEY(0);

    -- Finge que o controlador de memória está sempre pronto
    ready_sig <= '1';

    -- Converte as chaves SW[9:4] em um índice inteiro de 0 a 63 para a Dummy RAM
    ram_index <= to_integer(unsigned(SW(9 downto 4)));

    -- Processo da memória RAM falsa
    process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then
            -- Se for uma requisição de escrita (req = 1 e wEn = 1)
            if req_sig = '1' and wEn_sig = '1' then
                fake_ram(ram_index) <= data_bus;
            end if;
            
            -- Leitura síncrona
            read_data <= fake_ram(ram_index);
        end if;
    end process;

    -- Controle do barramento bidirecional de dados
    -- Se não estivermos escrevendo (wEn = '0'), colocamos o dado da RAM no barramento.
    -- Se estivermos escrevendo, deixamos em alta impedância ('Z') para a dram_iface dirigir o barramento.
    data_bus <= read_data when wEn_sig = '0' else (others => 'Z');

    -- Debug nos LEDs: 
    -- LEDR(9) acende quando há requisição (req)
    -- LEDR(8) acende quando é escrita (wEn)
    -- LEDR(7 downto 0) mostra o que está trafegando no barramento de dados
    LEDR(9) <= req_sig;
    LEDR(8) <= wEn_sig;

    -- Instanciação do módulo dram_iface
    inst_iface: dram_iface
        port map (
            clk      => CLOCK_50,
            rst      => rst_sig,
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

end rtl;