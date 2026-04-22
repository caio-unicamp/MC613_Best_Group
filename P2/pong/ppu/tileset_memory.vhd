library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tileset_memory is
    port (
        clk         : in  std_logic;
        x_pixel     : in  std_logic_vector(9 downto 0);
        y_pixel     : in  std_logic_vector(9 downto 0);
        tile_id     : in  std_logic_vector(7 downto 0);
        
        wr          : in  std_logic := '0';
        data_in     : in  std_logic_vector(7 downto 0) := (others => '0');
        
        pixel_data  : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of tileset_memory is
    -- 4 tiles de 32x32 = 4096 endereços
    type ram_type is array (0 to 4095) of std_logic_vector(7 downto 0);

    constant INITIAL_TILES : ram_type := (
        -- Tile 0 (0 até 1023): Tudo "0" (Preto/Transparente)
        0 to 1023 => x"00",
        
        -- Tile 1 (1024 até 2047): Tudo "1" (Branco/Cor sólida)
        1024 to 2047 => x"01",
        
        -- Tile 2 (2048 até 3071): Metade 0, Metade 1
        2048 to 2559 => x"00",
        2560 to 3071 => x"01",
        
        -- Tile 3 (3072 até 4095): Metade 1, Metade 0
        3072 to 3583 => x"01",
        3584 to 4095 => x"00"
    );

    signal ram : ram_type := INITIAL_TILES;

begin

    process(clk)
        variable x_offset : unsigned(4 downto 0);
        variable y_offset : unsigned(4 downto 0);
        variable addr_int : integer range 0 to 4095;
    begin
        if rising_edge(clk) then
            -- Posição 0-31 dentro do tile
            x_offset := unsigned(x_pixel(4 downto 0));
            y_offset := unsigned(y_pixel(4 downto 0));
            
            -- Endereço = (ID * 1024) + (Y_off * 32) + X_off
            -- Limitamos o ID em 2 bits (0 a 3) para garantir que não saia do range 4095
            addr_int := to_integer(unsigned(tile_id(1 downto 0))) * 1024 + (to_integer(y_offset) * 32) + to_integer(x_offset);
            
            -- Escrita
            if wr = '1' then
                ram(addr_int) <= data_in;
            end if;
            
            -- Leitura
            pixel_data <= ram(addr_int);
        end if;
    end process;

end architecture;