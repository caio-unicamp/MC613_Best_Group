library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sprite_memory is
    port (
        pixel_x       : in integer;
        pixel_y       : in integer;
        -- Posições vindas da lógica de controle
        ball_x        : in integer;
        ball_y        : in integer;
        p1_x          : in integer; -- Paddle 1 (Y fixo)
        p2_x          : in integer; -- Paddle 2 (Y fixo)
        
        -- Saídas para a PPU/ROM
        pixel_on      : out std_logic;
        sprite_id     : out integer range 0 to 3; -- ID para a ROM 
        rom_addr      : out integer range 0 to 1023 
    );
end sprite_memory;

architecture Behavioral of sprite_memory is
    constant TILE_SIZE : integer := 32; 
    constant PADDLE_SIZE : integer := 96; 
    constant P1_Y : integer := 32;  
    constant P2_Y : integer := 432; 
begin
    process(pixel_x, pixel_y, ball_x, ball_y, p1_x, p2_x)
        variable rel_x : integer;
        variable rel_y : integer;
    begin
        -- Default
        pixel_on <= '0';
        sprite_id <= 0;

        -- BOLA (ID 1)
        if (pixel_x >= ball_x and pixel_x < ball_x + TILE_SIZE and
            pixel_y >= ball_y and pixel_y < ball_y + TILE_SIZE) then
            
            pixel_on <= '1';
            sprite_id <= 1;
            rel_x := pixel_x - ball_x;
            rel_y := pixel_y - ball_y;
            rom_addr <= (rel_y * TILE_SIZE) + rel_x;

					  -- PADDLE 1 (ID 2)
			elsif (pixel_x >= p1_x and pixel_x < p1_x + PADDLE_SIZE and
					 pixel_y >= P1_Y and pixel_y < P1_Y + TILE_SIZE) then
				 
				 pixel_on <= '1';
				 sprite_id <= 2;
				 rel_x := (pixel_x - p1_x) mod TILE_SIZE; -- Repete o tile 3 vezes 
				 rel_y := pixel_y - P1_Y;
				 rom_addr <= (rel_y * TILE_SIZE) + rel_x; 

			-- PADDLE 2 (ID 2)
			elsif (pixel_x >= p2_x and pixel_x < p2_x + PADDLE_SIZE and
					 pixel_y >= P2_Y and pixel_y < P2_Y + TILE_SIZE) then
				 
				 pixel_on <= '1'; -- Estava '0' no seu código original 
				 sprite_id <= 2;
				 rel_x := (pixel_x - p2_x) mod TILE_SIZE;
				 rel_y := pixel_y - P2_Y;
				 rom_addr <= (rel_y * TILE_SIZE) + rel_x; 
			end if;
    end process;
end Behavioral;