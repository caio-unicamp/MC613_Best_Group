library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pixel_selector is
    port (
        -- Dados vindos da Camada de Sprites
        sprite_on       : in std_logic;
        sprite_color_idx: in integer range 0 to 3;
        
        -- Dados vindos da Camada de Background
        bg_color_idx    : in integer range 0 to 3;
        
        -- Saída para a Paleta de Cores
        final_color_idx : out integer range 0 to 3
    );
end pixel_selector;

architecture Behavioral of pixel_selector is
begin
    -- Lógica do Interceptor e Layer Selector combinada
    process(sprite_on, sprite_color_idx, bg_color_idx)
    begin
        -- Se o buscador de sprites indicar que há um objeto aqui (sprite_on)
        -- E o pixel do sprite não for transparente (idx /= 0)
        if (sprite_on = '1' and sprite_color_idx /= 0) then
            final_color_idx <= sprite_color_idx; -- Prioridade ao Sprite
        else
            final_color_idx <= bg_color_idx;    -- Caso contrário, mostra o fundo
        end if;
    end process;
end Behavioral;