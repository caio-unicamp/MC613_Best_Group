library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity game_logic is
    port (
        pixel_clk    : in  std_logic; -- Clock de 25.175 MHz gerado pelo PLL
        reset_n     : in  std_logic;
        keys        : in  std_logic_vector(3 downto 0); -- [P1L, P1R, P2L, P2R]
        
        -- Posições para a PPU
        p1_x        : out integer range 0 to 640;
        p2_x        : out integer range 0 to 640;
        ball_x      : out integer range 0 to 640;
        ball_y      : out integer range 0 to 480;
        
        -- Placar
        score1      : out unsigned(7 downto 0);
        score2      : out unsigned(7 downto 0)
    );
end game_logic;

architecture Behavioral of game_logic is
    -- Constantes de Dimensão
    constant P_WIDTH  : integer := 80;
    constant P_HEIGHT : integer := 10;
    constant B_SIZE   : integer := 8;
    constant SCREEN_W : integer := 640;
    constant SCREEN_H : integer := 480;
    constant SPEED    : integer := 5;

    signal pos_p1, pos_p2 : integer range 0 to 640 := 280;
    signal b_x : integer range 0 to 640 := 320;
    signal b_y : integer range 0 to 480 := 240;
    signal dx, dy : integer := 3;
    signal s1, s2 : unsigned(7 downto 0) := (others => '0');
begin
    p1_x <= pos_p1; p2_x <= pos_p2;
    ball_x <= b_x;  ball_y <= b_y;
    score1 <= s1;   score2 <= s2;

    process(pixel_clk, reset_n)
    begin
        if reset_n = '0' then
            -- Reset positions/scores
            pos_p1 <= 280; pos_p2 <= 280;
            b_x <= 320; b_y <= 240;
            s1 <= (others => '0'); s2 <= (others => '0');
        elsif rising_edge(pixel_clk) then
            -- Movimento Raquete Jogador 1 (Bottom)
            if keys(3) = '0' and pos_p1 > 0 then pos_p1 <= pos_p1 - SPEED; end if;
            if keys(2) = '0' and pos_p1 < SCREEN_W - P_WIDTH then pos_p1 <= pos_p1 + SPEED; end if;
            
            -- Movimento Raquete Jogador 2 (Top)
            if keys(1) = '0' and pos_p2 > 0 then pos_p2 <= pos_p2 - SPEED; end if;
            if keys(0) = '0' and pos_p2 < SCREEN_W - P_WIDTH then pos_p2 <= pos_p2 + SPEED; end if;

            -- Movimento Bola e Colisões Laterais
            if b_x <= 0 or b_x >= SCREEN_W - B_SIZE then dx <= -dx; end if;
            
            -- Colisão Raquete 1 (Bottom)
            if b_y >= SCREEN_H - 30 and b_x >= pos_p1 and b_x <= pos_p1 + P_WIDTH then
                dy <= -abs(dy);
            elsif b_y >= SCREEN_H then -- Ponto do Jogador 2
                s2 <= s2 + 1; b_x <= 320; b_y <= 240;
            end if;

            -- Colisão Raquete 2 (Top)
            if b_y <= 30 and b_x >= pos_p2 and b_x <= pos_p2 + P_WIDTH then
                dy <= abs(dy);
            elsif b_y <= 0 then -- Ponto do Jogador 1
                s1 <= s1 + 1; b_x <= 320; b_y <= 240;
            end if;

            b_x <= b_x + dx;
            b_y <= b_y + dy;
        end if;
    end process;
end Behavioral;