library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity game_logic is
    port (
        pixel_clk    : in  std_logic; -- Clock de 25.175 MHz gerado pelo PLL
        reset_n     : in  std_logic;
        key        : in  std_logic_vector(3 downto 0); -- [P1L, P1R, P2L, P2R]
        
        -- Posições para a PPU, que referenciam o canto superior esquerdo de cada objeto
        -- A orientação é 
        --0++++++++++++>
        --+
        --+
        --+
        --+
        --&or
        p1_x        : out integer range 0 to 639;
        p2_x        : out integer range 0 to 639;
        ball_x      : out integer range 0 to 639;
        ball_y      : out integer range 0 to 479;
        
        -- Placar
        score1      : out unsigned(7 downto 0);
        score2      : out unsigned(7 downto 0)
    );
end game_logic;

architecture Behavioral of game_logic is
    -- Constantes de Dimensão
    constant P_WIDTH  : integer := 96;  -- Cada barra dos players tem 3 tiles de largura
    constant P_HEIGHT : integer := 16;  -- E meio tile de altura
    constant B_SIZE   : integer := 32;  -- A bola tem 1 tile de diâmetro   
    constant SCREEN_W : integer := 640;
    constant SCREEN_H : integer := 480;
    constant SPEED    : integer := 5;   

    -- Posições Y fixas para as barras
    constant P1_Y_FIXED : integer := B_SIZE; -- Jogador 1 (topo) tem y fixo em um gap do tamanho da bola 
    constant P2_Y_FIXED : integer := SCREEN_H - B_SIZE - P_HEIGHT - 1;  -- Jogador 2 (base) está a B_SIZE + P_HEIGHT do máximo

    signal pos_p1_x, pos_p2_x : integer range 0 to 639 := 272;  -- As barras iniciam no meio (640 - 96)/2
    signal b_x : integer range 0 to 639 := 304; -- A bola também (640 - 32)/2
    signal b_y : integer range 0 to 479 := 224; -- (480 - 32)/2 
    signal dx, dy : integer := 3;   
    signal s1, s2 : unsigned(7 downto 0) := (others => '0');    -- Sinais do placar 
begin
    p1_x <= pos_p1_x; 
    p2_x <= pos_p2_x;
    ball_x <= b_x;  
    ball_y <= b_y;
    score1 <= s1;   
    score2 <= s2;

    process(pixel_clk, reset_n)
    begin
        if reset_n = '0' then
            -- Reset positions/scores
            pos_p1_x <= 272; 
            pos_p2_x <= 272;
            b_x <= 304; 
            b_y <= 224;
            s1 <= (others => '0'); 
            s2 <= (others => '0');
            dx <= 3;
            dy <= 3;
        elsif rising_edge(pixel_clk) then
            -- Movimento jogador 1
            if not(key(3) = '0' and key(2) = '0') then    -- Se aperta os dois botões ao mesmo tempo fica parado
                if key(3) = '0' and pos_p1_x > 0 then    -- Esquerda
                    if pos_p1_x < SPEED then  -- Pra não passar de 0
                        pos_p1_x <= 0;
                    else 
                        pos_p1_x <= pos_p1_x - SPEED; 
                    end if
                end if;

                if key(2) = '0' and pos_p1_x < SCREEN_W - P_WIDTH - 1 then -- Direita
                    if pos_p1_x > SPEED + SCREEN_W - P_WIDTH - 1 then  -- Pra não passar do máximo
                        pos_p1_x <= SCREEN_W - P_WIDTH - 1;   -- Seta no máximo
                    else 
                        pos_p1_x <= pos_p1_x + SPEED; 
                    end if
                end if;
            end if;

            -- Movimento jogador 2
            if not(key(1) = '0' and key(0) = '0') then    -- Se aperta os dois botões ao mesmo tempo fica parado
                if key(1) = '0' and pos_p1_x > 0 then    -- Esquerda
                    if pos_p2_x < SPEED then  -- Pra não passar de 0
                        pos_p2_x <= 0;
                    else 
                        pos_p2_x <= pos_p2_x - SPEED; 
                    end if
                end if;

                if key(2) = '0' and pos_p2_x < SCREEN_W - P_WIDTH - 1 then -- Direita
                    if pos_p2_x > SPEED + SCREEN_W - P_WIDTH - 1 then  -- Pra não passar do máximo
                        pos_p2_x <= SCREEN_W - P_WIDTH - 1;   -- Seta no máximo
                    else 
                        pos_p2_x <= pos_p2_x + SPEED; 
                    end if
                end if;
            end if;
            -- Movimento Bola e Colisões Laterais
            if b_x <= 0 or b_x >= SCREEN_W - B_SIZE - 1 then dx <= -dx; end if;
            
            -- Colisão com jogador 1
            if b_y <= P1_Y_FIXED + P_HEIGHT and b_x >= pos_p1_x and b_x <= pos_p1_x + P_WIDTH then
                dy <= -abs(dy);
            elsif b_y <= P1_Y_FIXED + P_HEIGHT then -- Ponto do Jogador 2
                s2 <= s2 + 1; 
                b_x <= 304; 
                b_y <= 224;
            end if;

            -- Colisão Raquete 2 (Top)
            if b_y >= P2_Y_FIXED and b_x >= pos_p2_x and b_x <= pos_p2_x + P_WIDTH then
                dy <= abs(dy);
            elsif b_y >= P2_Y_FIXED then -- Ponto do Jogador 1
                s1 <= s1 + 1; 
                b_x <= 304; 
                b_y <= 224;
            end if;

            b_x <= b_x + dx;
            b_y <= b_y + dy;
        end if;
    end process;
end Behavioral;