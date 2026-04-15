library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tileset_memory is
    port (
        clk         : in  std_logic;
        -- Coordenadas atuais do pixel na tela
        x_pixel     : in  std_logic_vector(9 downto 0);
        y_pixel     : in  std_logic_vector(9 downto 0);
        -- ID do tile vindo da background_ram
        tile_id     : in  std_logic_vector(7 downto 0);
        
        -- Controle de Escrita
        wr          : in  std_logic := '0';
        data_in     : in  std_logic_vector(7 downto 0) := (others => '0');
        
        -- Saída do Pixel (Cor/ID do pixel)
        pixel_data  : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of tileset_memory is
    -- 4 tiles de 32x32 = 4096 endereços
    type rom_type is array (0 to 4095) of std_logic_vector(7 downto 0);

    impure function init_tileset return rom_type is
        -- Certifique-se de que o arquivo está na pasta raiz do projeto
        file text_file       : text open read_mode is "tilesetmemory.txt";
        variable text_line   : line;
        variable rom_content : rom_type;
        variable bv          : bit_vector(7 downto 0);
    begin
        for i in 0 to 4095 loop
            if not endfile(text_file) then
                readline(text_file, text_line);
                read(text_line, bv);
                rom_content(i) := to_stdlogicvector(bv);
            else
                rom_content(i) := (others => '0');
            end if;
        end loop;
        return rom_content;
    end function;

    signal ram : rom_type := init_tileset;

begin

    process(clk)
        -- Variáveis para facilitar o cálculo do endereço
        variable x_offset : unsigned(4 downto 0);
        variable y_offset : unsigned(4 downto 0);
        variable addr_int : integer;
    begin
        if rising_edge(clk) then
            -- 1. Extraímos a posição relativa dentro do tile (0 a 31)
            x_offset := unsigned(x_pixel(4 downto 0));
            y_offset := unsigned(y_pixel(4 downto 0));
            
            -- 2. Calculamos o endereço linear:
            -- (ID * 1024) pula para o tile certo
            -- (Y * 32) + X navega dentro do desenho do tile
            addr_int := to_integer(unsigned(tile_id) * 1024 + (y_offset * 32) + x_offset);
            
            -- 3. Operação de Escrita
            if wr = '1' then
                ram(addr_int) <= data_in;
            end if;
            
            -- 4. Leitura Síncrona
            pixel_data <= ram(addr_int);
        end if;
    end process;

end architecture;