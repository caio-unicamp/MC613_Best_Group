library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity background_ram is
    port (
        clk         : in  std_logic;
        x_pixel     : in  std_logic_vector(9 downto 0);
        y_pixel     : in  std_logic_vector(9 downto 0);

        wr          : in  std_logic;
        data_in     : in std_logic_vector(7 downto 0);
        tile_id     : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of background_ram is
    type ram_type is array (0 to 299) of std_logic_vector(7 downto 0);

    constant MAP_DATA : ram_type := (

        0 to 119 => x"00", 
        129 to 130 => x"02", 
        140 to 159 => x"01", 
        169 to 170 => x"03",        

        others => x"00"
    );

    signal ram : ram_type := MAP_DATA;
    signal address : integer range 0 to 299; 

begin
    address <= (to_integer(unsigned(y_pixel(9 downto 5))) * 20) + 
                to_integer(unsigned(x_pixel(9 downto 5)));

    process(clk)
    begin
        if rising_edge(clk) then
            if wr = '1' then
                ram(address) <= data_in;
            else
                tile_id <= ram(address);
            end if;
        end if;
    end process;
end architecture;