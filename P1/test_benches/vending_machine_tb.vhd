library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity vending_machine_tb is
end vending_machine_tb;

architecture behavioral of vending_machine_tb is

    signal test_input  : STD_LOGIC_VECTOR(3 downto 0);
    signal test_output : STD_LOGIC_VECTOR(10 downto 0);

begin

    uut: entity work.vending_machine
        port map(
            codigo_produto => test_input,
            valor_produto  => test_output
        );

    test_process: process
        variable line_out : line;
    begin

        write(line_out, string'("Iniciando teste"));
        writeline(output, line_out);

        write(line_out, string'("Tempo | Entrada | Saida"));
        writeline(output, line_out);

        -- testa todos os valores (0 a 15)
        for i in 0 to 15 loop

            test_input <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;

            write(line_out, now);
            write(line_out, string'(" | "));
            write(line_out, test_input);
            write(line_out, string'(" | "));
            write(line_out, test_output);
            writeline(output, line_out);

        end loop;

        write(line_out, string'("Fim da simulacao"));
        writeline(output, line_out);

        wait; -- encerra

    end process;

end behavioral;