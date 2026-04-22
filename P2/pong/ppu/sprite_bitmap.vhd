library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sprite_bitmap is
    port (
        clk         : in std_logic;
        sprite_id   : in integer range 0 to 3;   -- 1: Bola, 2: P1, 3: P2
        rom_addr    : in integer range 0 to 1023; -- Endereço relativo (32x32)
        color_idx   : out integer range 0 to 3    -- Índice para a Paleta de Cores
    );
end sprite_bitmap;

architecture Behavioral of sprite_bitmap is
    -- Definição do tipo para armazenar os bitmaps (32x32 = 1024 pixels)
    type rom_type is array (0 to 1023) of integer range 0 to 3;

    constant PADDLE_TILE_BITMAP : rom_type := (
        0 to 511    => 1, 
        512 to 1023 => 0  
    );
    
    -- Para a bola, podemos fazer o mesmo
    constant BOLA_BITMAP : rom_type := (others => 2); -- Tudo cor 2 (ex: branco)

begin
    process(clk)
    begin
        if rising_edge(clk) then
            case sprite_id is
                when 1 => -- Desenha a Bola
                    color_idx <= BOLA_BITMAP(rom_addr);
                
                when 2 => -- Desenha os Paddles (P1 e P2)
                    -- Como a Sprite_RAM envia o endereço com 'mod 32',
                    -- este mesmo bitmap será repetido 3 vezes na horizontal.
                    color_idx <= PADDLE_TILE_BITMAP(rom_addr);
                
                when others =>
                    color_idx <= 0; -- Transparência total
            end case;
        end if;
    end process;
end Behavioral;