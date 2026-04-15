library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity background_ram is
    port (
        clk         : in  std_logic;
        -- Coordenadas da tela vindas do contador VGA
        x_pixel     : in  std_logic_vector(9 downto 0);
        y_pixel     : in  std_logic_vector(9 downto 0);

        -- Escrita (1) ou Leitura (0)
        wr          : in  std_logic;
        -- Dados de entrada para escrita
        data_in     : in std_logic_vector(7 downto 0);
        -- ID do tile que será enviado para a tileset_memory
        tile_id     : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of background_ram is
    -- Grade de 20 colunas x 15 linhas = 300 tiles
    type ram_type is array (0 to 299) of std_logic_vector(7 downto 0);

    -- MAPA HARDCODED
    -- Cálculo: Índice = (Linha * 20) + Coluna
    constant MAP_DATA : ram_type := (
        -- Linhas 0 a 5: Tudo Preto (Fundo)
        0 to 119 => x"00", 

        -- Linha 6: Topo da "bola" na coluna 10 (6 * 20 + 10 = 130)
        130 => x"02", 
        
        -- Linha 7: Faixa branca com a base da "bola" na coluna 10 (7 * 20 + 10 = 150)
        140 to 159 => x"01", 
        170 => x"03",        -- Base da bola (Tile 3) no meio da faixa

        -- Linha 8 em diante: Tudo Preto
        160 to 299 => x"00",
        
        -- Garante que qualquer índice não especificado seja zero
        others => x"00"
    );

    signal ram : ram_type := MAP_DATA;
    signal address : integer range 0 to 299; 

begin
    -- O CÁLCULO DO ENDEREÇO
    -- Colocamos fora do process para ser combinatório e ganhar tempo no ciclo de clock.
    -- (y_pixel / 32) * 20 + (x_pixel / 32)
    address <= (to_integer(unsigned(y_pixel(9 downto 5))) * 20) + 
                to_integer(unsigned(x_pixel(9 downto 5)));

    process(clk)
    begin
        if rising_edge(clk) then
            if wr = '1' then
                ram(address) <= data_in;
            else
                -- Leitura Síncrona: O tile_id estará disponível no próximo clock
                tile_id <= ram(address);
            end if;
        end if;
    end process;
end architecture;