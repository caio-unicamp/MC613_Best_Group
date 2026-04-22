library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ppu_background_tb is
    -- Testbench não possui portas
end ppu_background_tb;

architecture sim of ppu_background_tb is
    -- Sinais de Clock e Controle
    signal clk          : std_logic := '0';
    signal video_on     : std_logic := '1';
    
    -- Coordenadas de Pixel
    signal pixel_x      : integer := 0;
    signal pixel_y      : integer := 0;
    
    -- Posições dos Sprites (Estáticas para o teste)
    signal ball_x       : integer := 304; -- Posição x da bola 
    signal ball_y       : integer := 224; -- Posição y da bola 
    signal p1_x         : integer := 272; -- Posição do Jogador 1 
    signal p2_x         : integer := 272; -- Posição do Jogador 2 
    
    -- Saídas de Cor RGB de 8 bits
    signal r_out, g_out, b_out : std_logic_vector(7 downto 0);

    constant CLK_PERIOD : time := 39.72 ns;

begin
    -- Geração de Clock
    clk <= not clk after CLK_PERIOD/2;

    -- Instância da PPU UUT(Unidade Sob Teste)
    UUT: entity work.ppu
        port map (
            clk      => clk, 
            pixel_x  => pixel_x, 
            pixel_y  => pixel_y, 
            video_on => video_on, 
            ball_x   => ball_x, 
            ball_y   => ball_y, 
            p1_x     => p1_x, 
            p2_x     => p2_x, 
            r_out    => r_out, 
            g_out    => g_out, 
            b_out    => b_out 
        );

    -- Processo de Estímulo
    stim_proc: process
    begin
        -- Aguarda estabilização inicial
        video_on <= '1';
        wait for CLK_PERIOD * 5;
        
        -- TESTE 1: Pixel no Fundo (Preto - Tile 0)
        -- Esperamos R=0, G=0, B=0
        report "--- TESTE 1: BACKGROUND PRETO ---";
        pixel_x <= 10;
        pixel_y <= 10;
        wait for CLK_PERIOD * 4; -- Aguarda latência da PPU (RAM + Tileset + Palette)

        -- TESTE 2: Pixel na Bola (Cor 2 - Verde)
        -- A bola está em (304 - 335, 224 - 255). Vamos testar o centro dela.
        report "--- TESTE 2: PIXEL DA BOLA (VERDE) ---";
        pixel_x <= 320;
        pixel_y <= 240;
        wait for CLK_PERIOD * 4;

        -- TESTE 3: Pixel no Paddle 1 (Cor 1 - Branco)
        -- O Paddle 1 está em X = 272 a 367 e Y= 32 a 47. O bitmap tem branco na metade inferior
        report "--- TESTE 3: PIXEL DO PADDLE (BRANCO) ---";
        pixel_x <= 280;
        pixel_y <= 40; 
        wait for CLK_PERIOD * 4;


        -- TESTE 4: Blanking (Video_ON = '0')
        -- Forçando um pixel em cima do Paddle, mas com o monitor fora da área visível
        report "--- TESTE 4: BLANKING DE VIDEO ---";
        pixel_x <= 280;
        pixel_y <= 40; 
        video_on <= '0';
        wait for CLK_PERIOD * 4;
                    
        video_on <= '1';

        -- TESTE 5: Pixel na Faixa Branca do Fundo (Tile 1)
        -- A faixa branca está na linha 8 da RAM (Y entre 256 e 287) 
        report "--- TESTE 5: BACKGROUND BRANCO (TILE 1) ---";
        pixel_x <= 63;
        pixel_y <= 260;
        wait for CLK_PERIOD * 4;

        report "Simulação Concluída!";
        wait;
    end process;

end sim;