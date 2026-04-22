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
        --0 + + + + + + >
        --+
        --+
        --+
        --+
        --\/
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
    -- Dimensões das barras dos jogadores
    constant P_WIDTH         : integer := 96;  -- Cada barra dos players tem 3 tiles de largura
    constant P_HEIGHT        : integer := 16;  -- E meio tile de altura
    
    constant B_SIZE          : integer := 32;  -- A bola tem 1 tile de diâmetro   

    -- Tamanhos máximos da tela 640 x 480
    constant SCREEN_W        : integer := 640;
    constant SCREEN_H        : integer := 480;
    
    -- Velocidades dos movimentos de cada orientação em módulo
    constant SPEED_PLAYER    : integer := 5;   
    constant SPEED_BALL      : integer := 3;

    -- Posições padrões de reset
    constant MEIO_PLAYER_X   : integer := 272;  -- As barras iniciam no meio (640 - 96)/2
    constant MEIO_BOLA_X     : integer := 304;  -- A bola também (640 - 32)/2
    constant MEIO_BOLA_Y     : integer := 224;  -- (480 - 32)/2

    -- Posições Y fixas para as barras
    constant P1_Y_FIXED : integer := B_SIZE; -- Jogador 1 (topo) tem y fixo em um gap do tamanho da bola 
    constant P2_Y_FIXED : integer := SCREEN_H - B_SIZE - P_HEIGHT - 1;  -- Jogador 2 (base) está a B_SIZE + P_HEIGHT do máximo

	constant UPDATE_FREQ : integer := 250000; 
    signal update_counter : integer range 0 to UPDATE_FREQ := 0;
	 
    signal pos_p1_x, pos_p2_x : integer range 0 to 639 := MEIO_PLAYER_X;  
    signal b_x : integer range 0 to 639 := MEIO_BOLA_X; 
    signal b_y : integer range 0 to 479 := MEIO_BOLA_Y;  
    signal dx, dy : integer := 0;   -- Velocidade inicial da bola é 0
    signal s1, s2 : unsigned(7 downto 0) := (others => '0');	-- Sinais do placar 
    
    -- Sinal interno do estado de jogo 
    type state_type is (START, PLAY);
    signal current_state : state_type := START;

    signal random_seed : integer range 0 to 3 := 0;

begin
    p1_x <= pos_p1_x; 
    p2_x <= pos_p2_x;
    ball_x <= b_x;  
    ball_y <= b_y;
    score1 <= s1;   
    score2 <= s2;

    process(pixel_clk, reset_n)
    -- Variáveis para prever a próxima posição e evitar underflow/overflow
        variable next_b_x : integer;
        variable next_b_y : integer;
        
    begin
        if reset_n = '0' then
            -- Reset positions/scores
            pos_p1_x <= MEIO_PLAYER_X; 
            pos_p2_x <= MEIO_PLAYER_X;
            b_x <= MEIO_BOLA_X; 
            b_y <= MEIO_BOLA_Y;
            s1 <= (others => '0'); 
            s2 <= (others => '0');
            current_state <= START;
            random_seed <= 0;

        elsif rising_edge(pixel_clk) then
            -- O gerador de aleatoriedade gira livremente a cada clock
            if random_seed = 3 then 
                random_seed <= 0;
            else 
                random_seed <= random_seed + 1; 
            end if;
				if update_counter = UPDATE_FREQ then
                update_counter <= 0; -- Reinicia o contador
					 
					if current_state = START then   -- Aguardando o início do jogo
						 -- Se qualquer botão for pressionado
						 if key(0)='0' or key(1)='0' or key(2)='0' or key(3)='0' then
							  current_state <= PLAY;
							  
							  -- Sorteia a direção inicial da bola usando a 'seed' daquele exato nanossegundo
							  if random_seed = 0 then    dx <= SPEED_BALL;  dy <= SPEED_BALL;
							  elsif random_seed = 1 then dx <= -SPEED_BALL; dy <= SPEED_BALL;
							  elsif random_seed = 2 then dx <= SPEED_BALL;  dy <= -SPEED_BALL;
							  else                       dx <= -SPEED_BALL; dy <= -SPEED_BALL;
							  end if;
						 end if;

						 else
						 
						 -- Movimento do jogador 1
							if key(3) = '0' and key(2) = '1' then -- Somente Esquerda
								 if pos_p1_x > 0 then
									  if pos_p1_x < SPEED_PLAYER then
											pos_p1_x <= 0;
									  else
											pos_p1_x <= pos_p1_x - SPEED_PLAYER;
									  end if;
								 end if;
							elsif key(2) = '0' and key(3) = '1' then -- Somente Direita
								 if pos_p1_x < SCREEN_W - P_WIDTH - 1 then
									  if pos_p1_x > SCREEN_W - P_WIDTH - 1 - SPEED_PLAYER then
											pos_p1_x <= SCREEN_W - P_WIDTH - 1;
									  else
											pos_p1_x <= pos_p1_x + SPEED_PLAYER;
									  end if;
								 end if;
							end if;

							-- Movimento do jogador 2
							if key(1) = '0' and key(0) = '1' then -- Somente Esquerda
								 if pos_p2_x > 0 then
									  if pos_p2_x < SPEED_PLAYER then
											pos_p2_x <= 0;
									  else
											pos_p2_x <= pos_p2_x - SPEED_PLAYER;
									  end if;
								 end if;
							elsif key(0) = '0' and key(1) = '1' then -- Somente Direita
								 if pos_p2_x < SCREEN_W - P_WIDTH - 1 then
									  if pos_p2_x > SCREEN_W - P_WIDTH - 1 - SPEED_PLAYER then
											pos_p2_x <= SCREEN_W - P_WIDTH - 1;
									  else
											pos_p2_x <= pos_p2_x + SPEED_PLAYER;
									  end if;
								 end if;
							end if;

						 -- Física da bola
						 next_b_x := b_x + dx;
						 next_b_y := b_y + dy;

						 -- Colisão com as Paredes Laterais (Eixo X)
						 if next_b_x <= 0 then 
							  b_x <= 0;   -- Crava na borda esquerda
							  dx <= abs(dx);  -- Inverte o movimento para a direita
						 elsif next_b_x >= (SCREEN_W - B_SIZE - 1) then 
							  b_x <= SCREEN_W - B_SIZE - 1; -- Crava na borda direita
							  dx <= -abs(dx); -- Inverte o movimento para a esquerda
						 else
							  b_x <= next_b_x; -- Movimento normal
						 end if;
						 
						 -- Colisão e Pontuação (Eixo Y)
						 
						 -- Colisão com o Jogador 1 (Topo)
						 if (next_b_y <= P1_Y_FIXED + P_HEIGHT) and (b_x + B_SIZE >= pos_p1_x) and (b_x <= pos_p1_x + P_WIDTH) then
							  b_y <= P1_Y_FIXED + P_HEIGHT; -- Crava na barra
							  dy <= abs(dy); -- Rebate para baixo
						 
						 -- Passou do Jogador 1 (Ponto para o Jogador 2)
						 elsif next_b_y <= P1_Y_FIXED + P_HEIGHT then 
							  s2 <= s2 + 1;
							  b_x <= MEIO_BOLA_X; 
							  b_y <= MEIO_BOLA_Y;
							  current_state <= START; -- Espera jogadores estarem prontos para lançar a bola
						 
						 -- Colisão com o Jogador 2 (Base)
						 elsif (next_b_y + B_SIZE >= P2_Y_FIXED) and (b_x + B_SIZE >= pos_p2_x) and (b_x <= pos_p2_x + P_WIDTH) then
							  b_y <= P2_Y_FIXED - B_SIZE; -- Crava na barra
							  dy <= -abs(dy); -- Rebate para cima
						 
						 -- Passou do Jogador 2 (Ponto para o jogador P1)
						 elsif (next_b_y + B_SIZE) >= P2_Y_FIXED then 
							  s1 <= s1 + 1;
							  b_x <= MEIO_BOLA_X; 
							  b_y <= MEIO_BOLA_Y;
							  current_state <= START; -- Espera jogadores estarem prontos para lançar a bola
						 
						 -- Movimento no eixo Y normal se não bateu em nada
						 else
							  b_y <= next_b_y;
						 end if;
					end if;
				else
					update_counter <= update_counter + 1;
            end if;
        end if;
    end process;
end Behavioral;