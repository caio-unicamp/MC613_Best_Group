library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity game_logic_tb is
-- Entidade de teste não possui portas
end game_logic_tb;

architecture sim of game_logic_tb is

    -- Sinais de entrada para o DUT (Device Under Test)
    signal pixel_clk : std_logic := '0';
    signal reset_n   : std_logic := '0';
    signal key       : std_logic_vector(3 downto 0) := "1111"; -- Botoes não pressionados

    -- Sinais de saída do DUT
    signal p1_x      : integer range 0 to 639;
    signal p2_x      : integer range 0 to 639;
    signal ball_x    : integer range 0 to 639;
    signal ball_y    : integer range 0 to 479;
    signal score1    : unsigned(7 downto 0);
    signal score2    : unsigned(7 downto 0);

    -- Constante de tempo do clock (25.175 MHz -> ~39.72 ns)
    constant CLK_PERIOD : time := 39.72 ns;

begin

    -- Instância do Módulo de Lógica do Jogo
    UUT: entity work.game_logic
        port map (
            pixel_clk => pixel_clk,
            reset_n   => reset_n,
            key       => key,
            p1_x      => p1_x,
            p2_x      => p2_x,
            ball_x    => ball_x,
            ball_y    => ball_y,
            score1    => score1,
            score2    => score2
        );

    -- Processo gerador de Clock contínuo
    clk_process: process
    begin
        pixel_clk <= '0';
        wait for CLK_PERIOD / 2;
        pixel_clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Processo principal de Estímulos
    stimulus_process: process
    begin
        -- Estado Inicial e Reset
        report "Iniciando Simulacao: Aplicando Reset...";
        reset_n <= '0';
        key <= "1111";
        wait for 100 us;
        
        reset_n <= '1';
        report "Reset liberado. Jogo no estado START.";
        wait for 1 ms;

        -- Iniciando o Jogo (Transição de START para PLAY)
        -- Simulando o aperto de um botão (Ex: KEY0 do P2) para lançar a bola
        report "Pressionando KEY(0) para iniciar o jogo...";
        key(0) <= '0'; 
        wait for 30 ms; -- Tempo de aperto do botão
        key(0) <= '1';   -- Solta o botão
        
        -- Observando o movimento livre da bola
        -- Cada atualização leva ~10ms (250000 ciclos de 40ns).
        -- Esperamos 50ms para ver a bola andar 5 vezes (dx/dy = 3 * 5 = 15 pixels)
        report "Aguardando 50ms para observar o deslocamento da bola...";
        wait for 50 ms;

        -- Movendo a Raquete do Jogador 1 (Topo) para a Esquerda
        -- Aperta KEY3 (P1L)
        report "Pressionando KEY(3) (P1 Esquerda)...";
        key(3) <= '0';
        wait for 30 ms; -- Segura por 30ms (deve mover 3 vezes = 15 pixels)
        key(3) <= '1';
        
        -- Movendo a Raquete do Jogador 2 (Base) para a Direita
        -- Aperta KEY0 (P2R)
        report "Pressionando KEY(0) (P2 Direita)...";
        key(0) <= '0';
        wait for 30 ms; -- Segura por 30ms
        key(0) <= '1';

		  wait for 50 ms;
		  report "Aplicando Reset...";
        reset_n <= '0';
		  wait for 100 us;
        reset_n <= '1';
		  
		  wait for 50 ms;
		  report "Pressionando KEY(0) (P2 Direita)...";
        key(0) <= '0';
        wait for 30 ms; -- Segura por 30ms
        key(0) <= '1';
		  
        -- 6. Aguardando tempo suficiente para uma colisão ou ponto
        -- A bola precisa percorrer de Y=224 até Y=32 ou Y=448.
        -- A uma velocidade de 3 pixels a cada 10ms, demorará aprox 650ms.
        report "Aguardando 800ms para observar a fisica de bordas/pontuacao...";
        wait for 800 ms;

        report "Fim da Simulacao.";
        wait; -- Para o processo de estímulos
    end process;

end sim;