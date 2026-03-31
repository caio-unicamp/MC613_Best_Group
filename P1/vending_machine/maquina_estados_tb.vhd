library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;
use ieee.std_logic_textio.all;

entity maquina_estados_tb is
end maquina_estados_tb;

architecture sim of maquina_estados_tb is

    -- Sinais para conectar à DUT (Device Under Test)
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

    -- Constante de clock (ex: 50MHz)
    constant clk_period : time := 20 ns;

	 -- Procedimento para print customizado
    procedure print_log(msg : string) is
        variable l : line;
    begin
        write(l, msg);
        writeline(output, l);
    end procedure;
	 
    -- Procedimento para printar o estado atual e sinais
    procedure print_status(msg : string) is
        variable l : line;
    begin
        write(l, msg);
		  writeline(output, l);
        write(l, string'(" | Estado_Out: "));
        write(l, estado_out);
        write(l, string'(" | Clr_Acum: "));
        write(l, clr_acumula);
        write(l, string'(" | Reset_Timer: "));
        write(l, reset_timer);
        writeline(output, l);
		  writeline(output, l);
    end procedure;

begin

    -- Instanciação da Unidade sob Teste (DUT)
    dut: entity work.maquina_estados
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

    -- Processo de Estímulo
    stim_proc: process
    begin
        -- Inicialização
        print_log("Iniciando Testbench da Maquina de Estados...");
        wait for clk_period * 2;

        -- CENÁRIO 1: Fluxo de Venda com Sucesso e Troco
        print_status("--- Inicio: Escolher Produto (000) ---");
        
        avancar <= '1';
        wait for clk_period;
        avancar <= '0';
        wait for clk_period;
        print_status("Avançou para Inserir Dinheiro (001)");

        valor_acumulado <= std_logic_vector(to_unsigned(500, 11)); -- Simula 5 reais
        venda_concluida <= '1';
        troco <= std_logic_vector(to_unsigned(100, 11)); -- Simula 1 real de troco
        wait for clk_period;
        venda_concluida <= '0';
        print_status("Venda concluída, indo para Dispensar (010)");

        wait for clk_period;
        done_timer <= '1'; -- Simula que passou 1 segundo
        wait for clk_period;
        print_status("Timer OK, indo para Devolver Troco (100)");
        done_timer <= '0';

        wait for clk_period;
        done_timer <= '1';
        wait for clk_period;
        print_status("Troco devolvido, voltando ao Inicio (000)");
        done_timer <= '0';

        -- CENÁRIO 2: Cancelamento com dinheiro inserido
        wait for clk_period * 2;
        avancar <= '1';
        wait for clk_period;
        avancar <= '0';
        
        valor_acumulado <= std_logic_vector(to_unsigned(200, 11));
        cancelar <= '1';
        wait for clk_period;
        cancelar <= '0';
        print_status("Cancelado com saldo, indo para Devolver Normal (011)");

        done_timer <= '1';
        wait for clk_period;
        print_status("Saldo devolvido, limpando acumulador e resetando");
        done_timer <= '0';

        -- CENÁRIO 3: Cancelamento sem dinheiro (volta direto)
        wait for clk_period * 2;
        avancar <= '1';
        wait for clk_period;
        avancar <= '0';
        
        valor_acumulado <= (others => '0');
        cancelar <= '1';
        wait for clk_period;
        cancelar <= '0';
        print_status("Cancelado sem saldo, volta direto para Inicial (000)");

        wait for clk_period * 5;
        report "Fim dos testes.";
        wait;
    end process;

end sim;