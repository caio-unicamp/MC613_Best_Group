library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hex_display is
    Port (
        bcd  : out std_logic_vector(15 downto 0)   -- milhar|centena|dezena|unidade  
        HEX0 : out STD_LOGIC_VECTOR(6 downto 0);     -- Displays para mostrar resultado
        HEX1 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX2 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX3 : out STD_LOGIC_VECTOR(6 downto 0);
    );
end hex_display;

architecture Behavioral of hex_display is
begin
	 
	bin2hex0: entity work.bin2hex
	port map (
		BIN => bcd(3 downto 0)
		HEX => HEX0
	);
	
	bin2hex1: entity work.bin2hex
		port map (
			BIN => bcd(3 downto 0)
			HEX => HEX1
		);
		
	bin2hex2: entity work.bin2hex
		port map (
			BIN => bcd(3 downto 0)
			HEX => HEX2
		);
	
	bin2hex3: entity work.bin2hex
		port map (
			BIN => bcd(3 downto 0)
			HEX => HEX3
		);	
	

end Behavioral;