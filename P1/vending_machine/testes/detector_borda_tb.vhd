library ieee;
use ieee.std_logic_1164.all;

entity detector_borda_tb is
end entity;

architecture behavior of detector_borda_tb is
    -- Sinais de interface
    signal clk       : std_logic := '0';
    signal botao_in  : std_logic := '1';
    signal pulso_out : std_logic;

    -- Configuração do Clock (50MHz)
    constant clk_period : time := 20 ns;

begin
    -- Instância do Componente
    uut: entity work.detector_borda
        port map (
            clk       => clk,
            botao_in  => botao_in,
            pulso_out => pulso_out
        );

    -- Gerador de Clock
    clk_process : process
    begin
        clk <= '0'; wait for clk_period/2;
        clk <= '1'; wait for clk_period/2;
    end process;

    -- Processo de Estímulo (Casos Terríveis)
    stim_proc: process
    begin
        report "--- Iniciando Testes de Estresse ---";

        -- CASO 1: Funcionamento Normal (Pressionar e Segurar)
        wait for 100 ns;
        botao_in <= '0'; -- Apertou
        wait for 100 ns;
        botao_in <= '1'; -- Soltou
        report "Teste 1 (Normal): Verifique se pulso_out deu 1 ciclo de clock.";

        -- CASO 2: O 'Glitch' (O botão treme e volta muito rápido)
        -- Tentar mudar o sinal e voltar antes do próximo pulso de clock
        wait for 100 ns;
        botao_in <= '0';
        wait for 5 ns;   -- Menor que o período do clock (20ns)
        botao_in <= '1';
        report "Teste 2 (Glitch): O pulso NAO deve ser gerado (filtro natural do flip-flop).";

        -- CASO 3: O 'Toque Fantasma' (Mudar exatamente na borda de subida do clock)
        -- Isso simula problemas de setup/hold time
        wait until rising_edge(clk);
        botao_in <= '0'; 
        wait for clk_period;
        botao_in <= '1';
        report "Teste 3 (Race Condition): Mudanca junto com o clock. Verifique estabilidade.";

        -- CASO 4: O 'Metralhadora' (Vários apertos seguidos)
        for i in 1 to 5 loop
            botao_in <= '0'; wait for clk_period;
            botao_in <= '1'; wait for clk_period;
        end loop;
        report "Teste 4 (Sequencial): Verifique se foram gerados 5 pulsos distintos.";

        -- CASO 5: Botão já começa em zero (Estado indefinido no reset)
        botao_in <= '0';
        wait for 50 ns;
        report "Teste 5 (Inicializacao): Verifique comportamento no primeiro ciclo.";

        report "--- Fim dos Testes  ---";
        wait;
    end process;

end architecture;
