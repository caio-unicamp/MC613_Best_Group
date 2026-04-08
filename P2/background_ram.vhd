library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all; 

entity background_ram is
    port (
        clk         : in  std_logic;
        --coordenadas da tela
        x_pixel     : in  std_logic_vector(9 downto 0);
        y_pixel     : in  std_logic_vector(9 downto 0);

        --se escreveremos (1) ou leremos (0)
        wr          : in  std_logic;
        --escrita
        data_in     : in std_logic_vector(7 downto 0);
        -- ID do tile que sai da memória
        tile_id     : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of background_ram is
    type ram_type is array (0 to 299) of std_logic_vector(7 downto 0);

    --leitura do txt
    impure function init_ram_bin return ram_type is
        file text_file       : text open read_mode is "tilemap.txt"; -- O nome do seu arquivo
        variable text_line   : line;
        variable ram_content : ram_type;
        variable bv          : bit_vector(7 downto 0);
    begin
        for i in 0 to 299 loop
            if not endfile(text_file) then
                readline(text_file, text_line);
                read(text_line, bv);
                ram_content(i) := to_stdlogicvector(bv);
            else
                ram_content(i) := (others => '0');
            end if;
        end loop;
        return ram_content;
    end function;
    -- RAM funcionando
    -- Aqui a memória é criada já com os dados
    signal ram : ram_type := init_ram_bin;
    signal address : integer range 0 to 299; 

begin
    address <= 20*to_integer(unsigned(y_pixel(9 downto 5))) + to_integer(unsigned(x_pixel(9 downto 5)));

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