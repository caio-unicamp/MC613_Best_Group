library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decode_moedas is
    Port (
        sw_moedas    : in  STD_LOGIC_VECTOR(5 downto 0); -- SW(9 downto 4)
        valor_moeda  : out STD_LOGIC_VECTOR(10 downto 0);
        moeda_valida : out STD_LOGIC
    );
end decode_moedas;

architecture Behavioral of decode_moedas is
begin
    process(sw_moedas)
    begin
        -- Assume que a moeda é válida por padrão, alterado caso caia no 'others'
        moeda_valida <= '1'; 
        
        case sw_moedas is
            when "000001" => valor_moeda <= std_logic_vector(to_unsigned(5, 11));   -- SW(4): R$ 0,05
            when "000010" => valor_moeda <= std_logic_vector(to_unsigned(10, 11));  -- SW(5): R$ 0,10
            when "000100" => valor_moeda <= std_logic_vector(to_unsigned(25, 11));  -- SW(6): R$ 0,25
            when "001000" => valor_moeda <= std_logic_vector(to_unsigned(50, 11));  -- SW(7): R$ 0,50
            when "010000" => valor_moeda <= std_logic_vector(to_unsigned(100, 11)); -- SW(8): R$ 1,00
            when "100000" => valor_moeda <= std_logic_vector(to_unsigned(200, 11)); -- SW(9): R$ 2,00
            when others   => 
                -- Nenhuma ou múltiplas chaves ativas
                valor_moeda <= (others => '0');
                moeda_valida <= '0'; 
        end case;
    end process;
end Behavioral;