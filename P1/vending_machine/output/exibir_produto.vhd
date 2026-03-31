library ieee;
use ieee.std_logic_1164.all;

entity exibir_produto is
    port (
        estado      		: in  std_logic_vector(2 downto 0);
		  clk             : in  STD_LOGIC;
		  BIN             : in  std_logic_vector(3 downto 0);
        HEX_5             : out std_logic_vector(6 downto 0)            
    );
end entity;

architecture rtl of exibir_produto is
	signal valor_travado : std_logic_vector(3 downto 0) := (others => '0');
begin
    process(all)
    begin

	 if rising_edge(clk) then
            if estado = "000" then
                valor_travado <= BIN;
            end if;
        end if;

    end process;

	 display_estado: entity work.bin2hex
        port map(
            BIN => valor_travado,
            HEX => HEX_5
        );
end architecture;