library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity delay_1s_tb is
end delay_1s_tb;

architecture Behavioral of delay_1s_tb is
    -- Componente a ser testado
    component delay_1s
        Port (
            clk         : in  STD_LOGIC;
            reset_timer : in  STD_LOGIC;
            done_timer  : out STD_LOGIC
        );
    end component;
    
    -- Sinais de teste
    signal test_clk         : STD_LOGIC := '0';
    signal test_reset_timer : STD_LOGIC := '0';
    signal test_done_timer  : STD_LOGIC;
    
    -- Definição do período do clock (50MHz = 20ns)
    constant clock_period : time := 20 ns;

begin
    -- Instância da Unidade Sob Teste (UUT)
    uut: delay_1s
        port map (
            clk         => test_clk,
            reset_timer => test_reset_timer,
            done_timer  => test_done_timer
        );
    
    -- Processo para gerar o Clock de 50MHz
    clk_process: process
    begin
        test_clk <= '0';
        wait for clock_period/2;
        test_clk <= '1';
        wait for clock_period/2;
    end process;

    -- Processo de estímulo
    test_process: process
    begin
        -- 1. Pulso de Reset inicial
        test_reset_timer <= '1';
        wait for 40 ns;
        test_reset_timer <= '0';
        
        -- 2. Aguarda o tempo necessário para o contador atingir o MAX_COUNT
        wait for 1 sec;
        
        -- Mantém o sinal em '1' por alguns ciclos para visualização no gráfico
        wait for 200000000 ns;
        
        -- 3. Testa o reset durante a operação
        test_reset_timer <= '1';
        wait for 40 ns;
        test_reset_timer <= '0';
		  
		   wait for 1 sec;

        wait; -- Finaliza a simulação
    end process;

end Behavioral;