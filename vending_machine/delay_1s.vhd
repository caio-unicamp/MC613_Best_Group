library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity delay_1s is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        done  : out STD_LOGIC
    );
end delay_1s;

architecture Behavioral of delay_1s is
    signal count : unsigned(25 downto 0) := (others => '0');
    constant MAX_COUNT : unsigned(25 downto 0) := to_unsigned(50000000 - 1, 26);
begin

process(clk, reset)
begin
    if reset = '1' then
        count <= (others => '0');
        done  <= '0';
    elsif rising_edge(clk) then
        if count = MAX_COUNT then
            done <= '1';           -- passou 1 segundo
            count <= (others => '0');
        else
            count <= count + 1;
            done <= '0';
        end if;
    end if;
end process;

end Behavioral;