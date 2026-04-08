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
        sprite_id     : out integer range 0 to 3; -- ID para a ROM de desenho
    );
end sprite_memory;

architecture Behavioral of sprite_memory is
    constant SIZE : integer := 30; 
    constant P1_Y : integer := 15;  
    constant P2_Y : integer := 600; 
begin
    process(pixel_x, pixel_y, ball_x, ball_y, p1_x, p2_x)
        variable rel_x : integer;
        variable rel_y : integer;
    begin
        -- Default
        pixel_on <= '0';
        sprite_id <= 0;

        -- BOLA (ID 1)
        if (pixel_x >= ball_x and pixel_x < ball_x + SIZE and
            pixel_y < ball_y and pixel_y >= ball_y - SIZE) then
            
            pixel_on <= '1';
            sprite_id <= 1;
            rel_x := pixel_x - ball_x;
            rel_y := pixel_y - ball_y;

        -- PADDLE 1 (ID 2)
        elsif (pixel_x >= P1_Y and pixel_x < P1_Y + SIZE and
               pixel_y < p1_x and pixel_y >= p1_x - SIZE) then
            
            pixel_on <= '1';
            sprite_id <= 2;
            rel_x := pixel_x - P1_Y;
            rel_y := pixel_y - p1_x;

        -- PADDLE 2 (ID 2)
        elsif (pixel_x >= P2_Y and pixel_x < P2_Y + SIZE and
               pixel_y < p2_x and pixel_y >= p2_x - SIZE) then
            
            pixel_on <= '1';
            sprite_id <= 2;
            rel_x := pixel_x - P2_Y;
            rel_y := pixel_y - p2_x;
        end if;
    end process;
end Behavioral;