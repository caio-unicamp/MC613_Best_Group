library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all; -- Necessário para printar std_logic_vector

entity exibir_produto_tb is
end entity;

architecture sim of exibir_produto_tb is
    -- Sinais para conectar ao componente
    signal s_estado  : std_logic_vector(2 downto 0) := "000";
    signal s_clk     : std_logic := '0';
    signal s_bin     : std_logic_vector(3 downto 0) := "0000";
    signal s_hex5    : std_logic_vector(6 downto 0);

    -- Constante de clock
    constant clk_period : time := 10 ns;

    -- Procedimento para printar os resultados (Equivalente ao "print")
    procedure print_status(msg : string) is
        variable l : line;
    begin
        write(l, msg);
        write(l, string'(" | Estado: "));
        write(l, s_estado);
        write(l, string'(" | BIN (Entrada): "));
        write(l, s_bin);
        write(l, string'(" | HEX_5 (Saída): "));
        write(l, s_hex5);
        writeline(output, l);
    end procedure;

begin
    -- Instanciação da Unidade Sob Teste (UUT)
    uut: entity work.exibir_produto
        port map (
            estado => s_estado,
            clk    => s_clk,
            BIN    => s_bin,
            HEX_5  => s_hex5
        );

    -- Geração do Clock
    clk_process : process
    begin
        while now < 200 ns loop
            s_clk <= '0';
            wait for clk_period/2;
            s_clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;

    -- Processo de Estímulo
    stim_proc: process
    begin
        -- Caso 1: Estado "000" (Permite atualização do valor_travado)
        s_estado <= "000";
        s_bin    <= "0001"; -- Queremos mostrar '1'
        wait for clk_period * 2;
        print_status("1.");

        -- Caso 2: Mudar BIN enquanto estado ainda é "000"
        s_bin    <= "0101"; -- Mudar para '5'
        wait for clk_period * 2;
        print_status("2.");

        -- Caso 3: Mudar estado para algo diferente de "000" e mudar BIN
        -- O valor no display (HEX_5) deve permanecer travado em '5'
        s_estado <= "001";
        s_bin    <= "1000"; -- Tentar mudar entrada para '8'
        wait for clk_period * 2;
        print_status("3.");

        -- Caso 4: Testar outro valor no limite (F)
        s_estado <= "000";
        s_bin    <= "1111"; -- Letra 'F' no conversor bin2hex
        wait for clk_period * 2;
        print_status("4.");

        -- Caso 5: Bloquear novamente e mudar BIN
        s_estado <= "010";
        s_bin    <= "0000";
        wait for clk_period * 2;
        print_status("5.");
		  
        wait;
    end process;

end architecture;