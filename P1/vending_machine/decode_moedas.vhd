library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decode_moedas is
    Port (
        sw_moedas    : in  STD_LOGIC_VECTOR(9 downto 4);
        valor_moeda  : out STD_LOGIC_VECTOR(10 downto 0);
        moeda_valida : out STD_LOGIC
    );
end decode_moedas;

architecture Behavioral of decode_moedas is
begin
    process(sw_moedas)
    begin
        -- Assume que a moeda é válida por padrão, muda caso caia no 'others'
        moeda_valida <= '1'; 
        
        case sw_moedas is
            when "000001" => valor_moeda <= "00000000101"; -- 5 centavos
            when "000010" => valor_moeda <= "00000001010"; -- 10 centavos
            when "000100" => valor_moeda <= "00000011001"; -- 25 centavos
            when "001000" => valor_moeda <= "00000110010"; -- 50 centavos
            when "010000" => valor_moeda <= "00001100100"; -- 100 centavos (1 real)
            when "100000" => valor_moeda <= "00011001000"; -- 200 centavos (2 reais)
            when others   => 
                -- Nenhuma ou múltiplas chaves ativas
                valor_moeda <= (others => '0');
                moeda_valida <= '0'; 
        end case;
    end process;
end Behavioral;