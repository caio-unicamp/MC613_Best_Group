library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity color_palette is
    port (
        color_idx : in integer range 0 to 3; -- Índice vindo do Pixel Selector
        video_on  : in std_logic;            -- Sinal de área ativa do VGA Controller
        r_out     : out std_logic_vector(7 downto 0);
        g_out     : out std_logic_vector(7 downto 0);
        b_out     : out std_logic_vector(7 downto 0)
    );
end color_palette;

architecture Behavioral of color_palette is
begin
    process(color_idx, video_on)
    begin
        -- Proteção: Se estiver fora da área visível, a cor deve ser PRETA
        if video_on = '0' then
            r_out <= (others => '0');
            g_out <= (others => '0');
            b_out <= (others => '0');
        else
            case color_idx is
                when 0 => 
                    -- PRETO (Fundo ou Transparência)
                    r_out <= "00000000";
                    g_out <= "00000000";
                    b_out <= "00000000";
                
                when 1 => 
                    -- BRANCO (Paddles ou Bola)
                    r_out <= "11111111";
                    g_out <= "11111111";
                    b_out <= "11111111";
                
                when 2 => 
                    -- VERDE
                    r_out <= "00000000";
                    g_out <= "11111111";
                    b_out <= "00000000";
                
                when others => 
                    -- Padrão de segurança: PRETO
                    r_out <= (others => '0');
                    g_out <= (others => '0');
                    b_out <= (others => '0');
            end case;
        end if;
    end process;
end Behavioral;