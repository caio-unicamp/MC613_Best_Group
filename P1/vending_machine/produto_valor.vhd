library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity produto_valor is
    Port (
        codigo_produto : in  STD_LOGIC_VECTOR(3 downto 0);
        valor_produto  : out STD_LOGIC_VECTOR(10 downto 0)
    );
end produto_valor;

architecture Behavioral of produto_valor is
begin

process(codigo_produto)
begin

    case codigo_produto is

        when "0000" =>
            valor_produto <= "00001111101"; -- 125

        when "0001" =>
            valor_produto <= "00100101100"; -- 300

        when "0010" =>
            valor_produto <= "00010101111"; -- 175

        when "0011" =>
            valor_produto <= "00111000010"; -- 450

        when "0100" =>
            valor_produto <= "00011100001"; -- 225
        
        when "0101" =>
            valor_produto <= "00101011110"; -- 350

        when "0110" =>
            valor_produto <= "00011111010"; -- 250
        
        when "0111" =>
            valor_produto <= "00110101001"; -- 425

        when "1000" =>
            valor_produto <= "00111110100"; -- 500

        when "1001" =>
            valor_produto <= "00101000101"; -- 325

        when "1010" =>
            valor_produto <= "01001011000"; -- 600

        when "1011" =>
            valor_produto <= "00100010011"; -- 275

        when "1100" =>
            valor_produto <= "01010111100"; -- 700

        when "1101" =>
            valor_produto <= "00111011011"; -- 475

        when "1110" =>
            valor_produto <= "01000001101"; -- 525

        when "1111" =>
            valor_produto <= "01100100000"; -- 800

        when others =>
            valor_produto <= (others => '0');

    end case;

end process;

end Behavioral;
