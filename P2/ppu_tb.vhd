library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ppu_tb is
-- Testbench não possui portas
end ppu_tb;

architecture sim of ppu_tb is

    -- Sinais para conectar na PPU
    signal clk          : std_logic := '0';
    signal pixel_x      : integer := 0;
    signal pixel_y      : integer := 0;
    signal video_on     : std_logic := '0';
    
    signal ball_x       : integer := 320; -- Centro da tela
    signal ball_y       : integer := 240;
    signal p1_x         : integer := 50;  -- Jogador 1 à esquerda
    signal p2_x         : integer := 590; -- Jogador 2 à direita
    
    signal r_out, g_out, b_out : std_logic_vector(7 downto 0);

    -- Constantes de simulação
    constant CLK_PERIOD : time := 40 ns;

begin

    -- Instância da PPU (UUT)
    uut: entity work.ppu
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

    -- Gerador de Clock
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Processo de Estímulo
    stim_proc: process
    begin
        -- Reset inicial
        video_on <= '0';
        wait for 100 ns;
        video_on <= '1';

        -----------------------------------------------------------
        -- TESTE 1: Varredura de Background (Área sem objetos)
        -----------------------------------------------------------
        report "Teste 1: Lendo pixels de background (canto superior esquerdo)";
        pixel_x <= 10;
        pixel_y <= 10;
        wait for CLK_PERIOD * 3; -- Espera o pipeline das memórias

        -----------------------------------------------------------
        -- TESTE 2: Colisão com a Bola
        -----------------------------------------------------------
        report "Teste 2: Posicionando pixel sobre a bola";
        pixel_x <= 320;
        pixel_y <= 240;
        wait for CLK_PERIOD * 3;
        -- Aqui você verificaria se r_out, g_out, b_out correspondem à cor da bola

        -----------------------------------------------------------
        -- TESTE 3: Colisão com Jogador 1 (Paddles)
        -----------------------------------------------------------
        report "Teste 3: Posicionando pixel sobre o Player 1";
        pixel_x <= 50;
        pixel_y <= 240;
        wait for CLK_PERIOD * 3;

        -----------------------------------------------------------
        -- TESTE 4: Verificação de video_off (Blanking)
        -----------------------------------------------------------
        report "Teste 4: Verificando se as cores zeram com video_on='0'";
        video_on <= '0';
        wait for CLK_PERIOD * 2;
        assert (r_out = x"00" and g_out = x"00" and b_out = x"00")
            report "ERRO: Cores não zeraram no blanking!" severity error;
        
        video_on <= '1';

        -----------------------------------------------------------
        -- TESTE 5: Simulação de varredura de uma linha completa
        -----------------------------------------------------------
        report "Teste 5: Simulando varredura da linha 240";
        pixel_y <= 240;
        for i in 0 to 639 loop
            pixel_x <= i;
            wait for CLK_PERIOD;
        end loop;

        report "Fim da simulação da PPU.";
        wait;
    end process;

end sim;