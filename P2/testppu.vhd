library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ppu_tb is
end entity;

architecture sim of ppu_tb is
    -- Sinais de Controle
    signal clk          : std_logic := '0';
    signal reset_n      : std_logic := '0';
    
    -- Entradas da VGA (Varredura)
    signal pixel_x      : std_logic_vector(9 downto 0) := (others => '0');
    signal pixel_y      : std_logic_vector(9 downto 0) := (others => '0');
    signal video_active : std_logic := '1';
    
    -- Saídas de Cor da PPU
    signal r, g, b      : std_logic_vector(7 downto 0);
    
    -- Constante de Clock (50 MHz)
    constant CLK_PERIOD : time := 20 ns;

begin
    -- Instância da sua PPU (Ajuste as portas conforme sua implementação real)
    -- UUT = Unit Under Test
    UUT: entity work.PPU
        port map (
            clk          => clk,
            reset_n      => reset_n,
            pixel_x      => pixel_x,
            pixel_y      => pixel_y,
            video_active => video_active,
            r            => r,
            g            => g,
            b            => b,
            -- Mock de posições para testar os Sprites (ex: Raquete 1 e Bola)
            p1_x         => 100,  
            p2_x         => 100,
            ball_x       => 150,
            ball_y       => 150
        );

    -- Geração do Clock
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Estímulos de Teste (Simulando o feixe do VGA)
    stim_proc: process
    begin
        -- 1. Reset inicial
        reset_n <= '0';
        wait for CLK_PERIOD * 5;
        reset_n <= '1';
        wait for CLK_PERIOD * 5;

        -- 2. Teste de uma linha que cruza o Background Vazio e a Raquete
        -- Supondo que a Raquete P1 esteja em Y=464, X=100 (Largura 96)
        report "--- INICIANDO TESTE DE LINHA (Y=465) ---";
        pixel_y <= std_logic_vector(to_unsigned(465, 10));
        
        for i in 90 to 110 loop
            pixel_x <= std_logic_vector(to_unsigned(i, 10));
            wait for CLK_PERIOD;
            
            if i < 100 then
                -- Esperamos ver a cor do BACKGROUND (ou preto)
                report "Pixel X=" & integer'image(i) & " -> R=" & integer'image(to_integer(unsigned(r))) & " (Background)";
            else
                -- Esperamos ver a cor do SPRITE (Raquete)
                report "Pixel X=" & integer'image(i) & " -> R=" & integer'image(to_integer(unsigned(r))) & " (Sprite Raquete)";
            end if;
        end loop;

        -- 3. Teste de Sobreposição (Bola sobre o Background)
        -- Bola em (150, 150)
        report "--- INICIANDO TESTE DA BOLA (Y=160) ---";
        pixel_y <= std_logic_vector(to_unsigned(160, 10));
        
        for i in 145 to 155 loop
            pixel_x <= std_logic_vector(to_unsigned(i, 10));
            wait for CLK_PERIOD;
            report "Pixel X=" & integer'image(i) & " -> R=" & integer'image(to_integer(unsigned(r)));
        end loop;

        report "--- TESTE CONCLUÍDO ---";
        wait; -- Para a simulação
    end process;

end architecture;