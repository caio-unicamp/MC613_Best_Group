library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity hex_display_valor_tb is
end hex_display_valor_tb;

architecture Behavioral of hex_display_valor_tb is
    component hex_display_valor
        Port (
           bin_in  : in  std_logic_vector(10 downto 0);   -- milhar|centena|dezena|unidade  
			  HEX_0 : out STD_LOGIC_VECTOR(6 downto 0);     -- Displays para mostrar resultado
			  HEX_1 : out STD_LOGIC_VECTOR(6 downto 0);
			  HEX_2 : out STD_LOGIC_VECTOR(6 downto 0);
			  HEX_3 : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;
    
    signal test_input : STD_LOGIC_VECTOR(10 downto 0);
    signal test_output_0 : STD_LOGIC_VECTOR(6 downto 0);
	 signal test_output_1 : STD_LOGIC_VECTOR(6 downto 0);
	 signal test_output_2 : STD_LOGIC_VECTOR(6 downto 0);
	 signal test_output_3 : STD_LOGIC_VECTOR(6 downto 0);
begin
    uut: hex_display_valor
        port map (
			  bin_in  => test_input,   -- milhar|centena|dezena|unidade  
			  HEX_0 => test_output_0,    -- Displays para mostrar resultado
			  HEX_1 => test_output_1, 
			  HEX_2 => test_output_2,
			  HEX_3 => test_output_3
        );
    
    test_process: process
        variable line_out : line;
    begin
        write(line_out, string'("Testando bin2hex..."));
        writeline(output, line_out);
        
        -- Loop de 0 a 150
        for i in 0 to 1500 loop
            test_input <= std_logic_vector(to_unsigned(i, 11));
            wait for 10 ns;  -- Aguarda para o sinal estabilizar
            write(line_out, string'("Entrada: "));
            hwrite(line_out, test_input);
            write(line_out, string'(" | Saída: "));
				writeline(output, line_out);
            write(line_out, test_output_0);
            writeline(output, line_out);
				write(line_out, test_output_1);
            writeline(output, line_out);
				write(line_out, test_output_2);
            writeline(output, line_out);
				write(line_out, test_output_3);
            writeline(output, line_out);
        end loop;
        
        write(line_out, string'("Teste concluído"));
        writeline(output, line_out);
        wait;
    end process;
end Behavioral;