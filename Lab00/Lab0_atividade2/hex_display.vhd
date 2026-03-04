-- Módulo top-level que exibe o valor de 4 switches em hexadecimal
-- no display HEX0
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex_display is
    Port (
        SW : in STD_LOGIC_VECTOR(9 downto 0);   -- 10 switches (usaremos apenas SW(3 downto 0))
        HEX0 : out STD_LOGIC_VECTOR(6 downto 0); -- Primeiro Display de 7 segmentos
		  HEX1: out STD_LOGIC_VECTOR(6 downto 0) -- Segundo Display de 7 segmentos
    );
end hex_display;

architecture Behavioral of hex_display is
begin
	display0: entity work.bin2hex
		port map(
			BIN => SW(3 downto 0),
			HEX => HEX0
		);
	
	display1: entity work.bin2hex
		port map(
			BIN => SW(7 downto 4),
			HEX => HEX1
		);
    -- TODO: Instanciar o componente bin2hex aqui
    -- Conecte SW(3 downto 0) à entrada BIN do bin2hex
    -- Conecte a saída HEX do bin2hex ao display HEX0
    
    -- Dica: A sintaxe de instanciação é:
    -- nome_da_instancia: entity work.bin2hex
    --     port map (
    --         BIN => sinal_a_conectar,
    --         HEX => outro_sinal
    --     );

end Behavioral;
