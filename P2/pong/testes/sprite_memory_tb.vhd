library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sprite_memory_tb is
-- Entidade de testbench não possui portas
end sprite_memory_tb;

architecture sim of sprite_memory_tb is

    -- Sinais para conectar ao componente
    signal pixel_x   : integer := 0;
    signal pixel_y   : integer := 0;
    signal ball_x    : integer := 100;
    signal ball_y    : integer := 100;
    signal p1_x      : integer := 50;
    signal p2_x      : integer := 50;
    
    signal pixel_on  : std_logic;
    signal sprite_id : integer range 0 to 3;

    -- Constantes de temporização
    constant PERIOD  : time := 10 ns;

begin

    -- Instanciação da Unidade Sob Teste (UUT)
    uut: entity work.sprite_memory
        port map (
            pixel_x   => pixel_x,
            pixel_y   => pixel_y,
            ball_x    => ball_x,
            ball_y    => ball_y,
            p1_x      => p1_x,
            p2_x      => p2_x,
            pixel_on  => pixel_on,
            sprite_id => sprite_id
        );

    -- Processo de estímulo (Simula a varredura do feixe VGA)
    stim_proc: process
    begin
        -- Teste 1: Posição neutra (fundo/background)
        report "--- Iniciando Testes de Memoria de Sprites ---";
        pixel_x <= 0;
        pixel_y <= 0;
        wait for PERIOD;
        report "Teste 1 (Fundo): pixel_on=" & std_logic'image(pixel_on) & " ID=" & integer'image(sprite_id);
        
        -- Teste 2: Varredura sobre a BOLA (ID 1)
        -- A bola está em (100, 100). Lógica: pixel_x [100, 130) e pixel_y [70, 100)
        pixel_x <= 110;
        pixel_y <= 90;
        wait for PERIOD;
        report "Teste 2 (Bola): pixel_on=" & std_logic'image(pixel_on) & " ID=" & integer'image(sprite_id);
        assert (pixel_on = '1' and sprite_id = 1) 
            report "ERRO: Falha na deteccao da Bola" severity error;

        -- Teste 3: Varredura sobre o Paddle 1 (ID 2)
        -- P1_Y fixo em 15. p1_x entrada em 50. Lógica: x [15, 45) e y [20, 50)
        pixel_x <= 20; 
        pixel_y <= 40; 
        wait for PERIOD;
        report "Teste 3 (Paddle 1): pixel_on=" & std_logic'image(pixel_on) & " ID=" & integer'image(sprite_id);
        assert (pixel_on = '1' and sprite_id = 2) 
            report "ERRO: Falha na deteccao do Paddle 1" severity error;

        -- Teste 4: Varredura sobre o Paddle 2 (ID 3)
        -- P2_Y fixo em 600. p2_x entrada em 50. Lógica: x [600, 630) e y [20, 50)
        pixel_x <= 610; 
        pixel_y <= 30; 
        wait for PERIOD;
        report "Teste 4 (Paddle 2): pixel_on=" & std_logic'image(pixel_on) & " ID=" & integer'image(sprite_id);
        assert (pixel_on = '1' and sprite_id = 2) 
            report "ERRO: Falha na deteccao do Paddle 2" severity error;

        -- Teste 5: Área Vazia
        pixel_x <= 300;
        pixel_y <= 300;
        wait for PERIOD;
        report "Teste 5 (Vazio): pixel_on=" & std_logic'image(pixel_on);
        assert (pixel_on = '0') 
            report "ERRO: Sprite detectado em area vazia" severity error;

        -- Teste 6: Simulação de Movimento do Paddle 2
        report "Teste 6: Movendo Paddle 2 para p2_x = 200";
        p2_x <= 200;
        pixel_x <= 610; 
        pixel_y <= 180; -- Entre 200 e 200-30
        wait for PERIOD;
        report "Teste 6 (P2 Movido): pixel_on=" & std_logic'image(pixel_on) & " ID=" & integer'image(sprite_id);
        assert (pixel_on = '1' and sprite_id = 2) 
            report "ERRO: Falha apos movimento do Paddle 2" severity error;

        report "--- Todos os testes concluidos com sucesso! ---";
        wait;
    end process;

end sim;