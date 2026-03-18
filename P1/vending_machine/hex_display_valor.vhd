library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hex_display_valor is
    Port (
        bin_in  : in  std_logic_vector(10 downto 0);   -- milhar|centena|dezena|unidade  
        HEX_0 : out STD_LOGIC_VECTOR(6 downto 0);     -- Displays para mostrar resultado
        HEX_1 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX_2 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX_3 : out STD_LOGIC_VECTOR(6 downto 0)
    );
end hex_display_valor;

architecture Behavioral of hex_display_valor is
	signal bcd_out: std_logic_vector(15 downto 0);
begin

	bin2bcd: entity work.bin11_to_bcd4
		port map (
			bin => bin_in,
			bcd => bcd_out	
		);
	
	 
	bin2hex0: entity work.bin2hex
		port map (
			BIN => bcd_out(3 downto 0),
			HEX => HEX_0
		);
	
	bin2hex1: entity work.bin2hex
		port map (
			BIN => bcd_out(7 downto 4),
			HEX => HEX_1
		);
		
	bin2hex2: entity work.bin2hex
		port map (
			BIN => bcd_out(11 downto 8),
			HEX => HEX_2
		);
	
	bin2hex3: entity work.bin2hex
		port map (
			BIN => bcd_out(15 downto 12),
			HEX => HEX_3
		);	
	

end Behavioral;