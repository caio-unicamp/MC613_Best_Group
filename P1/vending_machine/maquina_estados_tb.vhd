library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;
use ieee.std_logic_textio.all;

entity maquina_estados_tb is
end maquina_estados_tb;

architecture sim of maquina_estados_tb is
    signal clk             : STD_LOGIC := '0';
    signal avancar         : STD_LOGIC := '0';
    signal cancelar        : STD_LOGIC := '0';
    signal valor_acumulado : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
    signal troco           : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
    signal venda_concluida : STD_LOGIC := '0';
    signal done_timer      : STD_LOGIC := '0';
    signal reset_timer     : STD_LOGIC;
    signal estado_out      : STD_LOGIC_VECTOR(2 downto 0);
    signal clr_acumula     : STD_LOGIC;

    constant clk_period : time := 20 ns;

    procedure print_status(msg : string) is
        variable l : line;
    begin
        write(l, msg);
        writeline(output, l);
        
        write(l, string'("Entradas -> AV:"));
        write(l, avancar);
        write(l, string'(" CANC:"));
        write(l, cancelar);
        write(l, string'(" ACUM:"));
        write(l, to_integer(unsigned(valor_acumulado)));
        write(l, string'(" TROCO:"));
        write(l, to_integer(unsigned(troco)));
        write(l, string'(" VENDA:"));
        write(l, venda_concluida);
        write(l, string'(" DONE_T:"));
        write(l, done_timer);
        writeline(output, l);

        write(l, string'("Saidas   -> ESTADO:"));
        write(l, estado_out);
        write(l, string'(" RST_T:"));
        write(l, reset_timer);
        write(l, string'(" CLR_ACUM:"));
        write(l, clr_acumula);
        writeline(output, l);
        write(l, string'("--------------------------------------------------"));
        writeline(output, l);
    end procedure;

begin

    -- Instância da Máquina de Estados
    uut: entity work.maquina_estados
        port map (
            clk             => clk,
            avancar         => avancar,
            cancelar        => cancelar,
            valor_acumulado => valor_acumulado,
            troco           => troco,
            venda_concluida => venda_concluida,
            done_timer      => done_timer,
            reset_timer     => reset_timer,
            estado_out      => estado_out,
            clr_acumula     => clr_acumula
        );

    -- Geração do Clock
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
		variable l : line;
    begin
        wait for clk_period;
        print_status("1. Esperando escolher_produto");

        avancar <= '1';
        wait for clk_period/2;
		  print_status("Sinal Avancar");
		  wait for clk_period/2;
        avancar <= '0';
        wait for clk_period;
        print_status("Avancou para inserir_dinheiro (estado_out 001)");

		  
		  writeline(output, l);
		  print_status("2. Cancelar sem saldo");
        cancelar <= '1';
        valor_acumulado <= std_logic_vector(to_unsigned(0, 11));
        wait for clk_period/2;
		  print_status("Sinal cancelar");
		  wait for clk_period/2;
        cancelar <= '0';
        wait for clk_period;
        print_status("Voltou para escolher_produto (estado_out 000)");

		  
		  writeline(output, l);
		  print_status("3. Cancelar com saldo");
        avancar <= '1';
        wait for clk_period;
        avancar <= '0';
        wait for clk_period;

        valor_acumulado <= std_logic_vector(to_unsigned(500, 11)); 
        cancelar <= '1';
        wait for clk_period/2;
		  print_status("Sinal cancelar");
		  wait for clk_period/2;
        cancelar <= '0';
        wait for clk_period;
        print_status("Indo para devolver_normal (estado_out 011)");

        done_timer <= '1';
        wait for clk_period/2;
		  print_status("Dinheiro devolvido. (done_timer=1)");
		  wait for clk_period/2;
        done_timer <= '0';
        wait for clk_period;
		  valor_acumulado <= std_logic_vector(to_unsigned(0, 11));
		  print_status("Voltou para escolher_produto."); 
        
		  
		  writeline(output, l);
		  print_status("4. Venda com troco");
        avancar <= '1'; wait for clk_period; avancar <= '0'; 
		  valor_acumulado <= std_logic_vector(to_unsigned(500, 11));
		  troco <= std_logic_vector(to_unsigned(150, 11)); 
        venda_concluida <= '1';
        wait for clk_period/2;
        print_status("Sinal venda concluida");
		  wait for clk_period/2;
		  venda_concluida <= '0';
		  wait for clk_period;
		  print_status("Indo para dispensar (estado_out 010)");

        done_timer <= '1';
        wait for clk_period/2;
		  print_status("Produto dispensado (done_timer=1)");
		  wait for clk_period/2;
        done_timer <= '0';
        wait for clk_period;
        print_status("Indo para devolver_troco (estado_out 100)");

        done_timer <= '1';
        wait for clk_period/2;
		  print_status("Troco devolvido. (done_timer=1)");
		  wait for clk_period/2;
        done_timer <= '0';
		  troco <= std_logic_vector(to_unsigned(0, 11));
        wait for clk_period;
        print_status("Fim do ciclo. Voltou para escolher_produto");
		  
		  
		  writeline(output, l);
		  valor_acumulado <= std_logic_vector(to_unsigned(500, 11)); 
		  print_status("5. Venda sem troco");
        avancar <= '1'; wait for clk_period; avancar <= '0'; 
        venda_concluida <= '1';
        wait for clk_period/2;
        print_status("Sinal venda concluida");
		  wait for clk_period/2;
		  venda_concluida <= '0';
		  wait for clk_period;
		  print_status("Indo para dispensar (estado_out 010)");

        done_timer <= '1';
        wait for clk_period/2;
		  print_status("Produto dispensado (done_timer=1)");
		  wait for clk_period/2;
        done_timer <= '0';
        wait for clk_period;
        print_status("Indo para escolher_produto");

        report "Fim do Testbench" severity note;
        wait;
    end process;

end sim;