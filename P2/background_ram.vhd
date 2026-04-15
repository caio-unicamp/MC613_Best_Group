library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity background_ram is
    port (
        clk         : in  std_logic;
        -- Coordenadas da tela
        x_pixel     : in  std_logic_vector(9 downto 0);
        y_pixel     : in  std_logic_vector(9 downto 0);

        -- Escrita (1) ou Leitura (0)
        wr          : in  std_logic;
        -- Escrita
        data_in     : in std_logic_vector(7 downto 0);
        -- ID do tile que sai da memória
        tile_id     : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of background_ram is
    type ram_type is array (0 to 299) of std_logic_vector(7 downto 0);

    -- DEFINIÇÃO DO MAPA (Substitui o arquivo TXT)
    -- Cada linha representa o ID de um tile na grade 20x15
    constant MAP_DATA : ram_type := (
        -- Linhas 0 a 6 (Zeros)
        0 to 129 => x"00",
        
        -- Linha 7: Seus dois "02" (Personagem ou item)
        130 => x"02", 131 => x"02",
        132 to 139 => x"00",
        
        -- Linha 7 (cont): Seus "01" (Chão/Plataforma)
        140 to 159 => x"01",
        
        -- Linhas seguintes
        160 to 168 => x"00",
        169 => x"03", 170 => x"03", -- Seus "03"
        
        -- O restante preenchemos com zero
        others => x"00"
    );

    signal ram : ram_type := MAP_DATA;
    signal address : integer range 0 to 299; 

begin
    -- Cálculo do endereço: 20 colunas * (Y/32) + (X/32)
    address <= 20 * to_integer(unsigned(y_pixel(9 downto 5))) + to_integer(unsigned(x_pixel(9 downto 5)));

    process(clk)
    begin
        if rising_edge(clk) then
            if wr = '0' then
                tile_id <= ram(address);
            else
                ram(address) <= data_in;
            end if;
        end if;
    end process;
end architecture;