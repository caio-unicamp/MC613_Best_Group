LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY vga_controller IS
  port (
    -- Entradas de Controle de Clock e Reset
    pixel_clk    : in  STD_LOGIC;                     -- Clock de 25.175 MHz gerado pelo PLL
    reset_n      : in  STD_LOGIC;                     -- Reset assíncrono (ativo baixo)

    -- Entradas de Cor (vindos da PPU)
    r_in         : in  STD_LOGIC_VECTOR(7 downto 0);  -- Intensidade do vermelho do pixel atual
    g_in         : in  STD_LOGIC_VECTOR(7 downto 0);  -- Intensidade do verde do pixel atual
    b_in         : in  STD_LOGIC_VECTOR(7 downto 0);  -- Intensidade do azul do pixel atual

    -- Saídas de Controle Interno (enviados para a PPU)
    pixel_x      : out STD_LOGIC_VECTOR(9 downto 0);  -- Coordenada X atual
    pixel_y      : out STD_LOGIC_VECTOR(9 downto 0);  -- Coordenada Y atual
    video_active : out STD_LOGIC;                     -- '1' se estiver dentro da área visível (Active Video)

    -- Saídas Físicas (conectadas aos pinos da DE1-SoC)
    VGA_R        : out STD_LOGIC_VECTOR(7 downto 0);  -- Saída VGA Vermelha
    VGA_G        : out STD_LOGIC_VECTOR(7 downto 0);  -- Saída VGA Verde
    VGA_B        : out STD_LOGIC_VECTOR(7 downto 0);  -- Saída VGA Azul
    VGA_HS       : out STD_LOGIC;                     -- Sincronismo Horizontal
    VGA_VS       : out STD_LOGIC;                     -- Sincronismo Vertical
    VGA_BLANK_N  : out STD_LOGIC;                     -- Fora da área visível
    VGA_SYNC_N   : out STD_LOGIC;                     -- Sincronização de vídeo (fixo em '1')
    VGA_CLK      : out STD_LOGIC                      -- Clock do pixel (espelho do pixel_clk)
  );
end VGA_Controller;

ARCHITECTURE arch of VGA_Controller is
    -- Constantes para 640x480 @ 60Hz
    constant H_ACTIVE : integer := 640;
    constant H_FP     : integer := 16;
    constant H_SYNC   : integer := 96;
    constant H_BP     : integer := 48;
    constant H_TOTAL  : integer := 800;

    constant V_ACTIVE : integer := 480;
    constant V_FP     : integer := 11;
    constant V_SYNC   : integer := 2;
    constant V_BP     : integer := 31;
    constant V_TOTAL  : integer := 524;

    signal h_count : integer range 0 to H_TOTAL - 1 := 0;
    signal v_count : integer range 0 to V_TOTAL - 1 := 0;
    signal is_active : STD_LOGIC;
begin
    VGA_CLK    <= pixel_clk;
    VGA_SYNC_N <= '1';  -- Fixo em 1

    -- Varredura de pixels
    process(pixel_clk, reset_n)
    begin
        if reset_n = '0' then -- Ativo
            h_count <= 0;
            v_count <= 0;
        elsif rising_edge(pixel_clk) then
            if h_count = H_TOTAL - 1 then
                h_count <= 0;
                if v_count = V_TOTAL - 1 then
                    v_count <= 0;
                else
                    v_count <= v_count + 1;
                end if;
            else
                h_count <= h_count + 1;
            end if;
        end if;
    end process;

    -- Sincronisação do sinal com o momento correto 
    VGA_HS <= '0' when (h_count >= (H_ACTIVE + H_FP)) and (h_count < (H_ACTIVE + H_FP + H_SYNC)) else '1';
    VGA_VS <= '0' when (v_count >= (V_ACTIVE + V_FP)) and (v_count < (V_ACTIVE + V_FP + V_SYNC)) else '1';

    -- Sinais de controle de vídeo
    is_active <= '1' when (h_count < H_ACTIVE) and (v_count < V_ACTIVE) else '0';
    video_active <= is_active;
    VGA_BLANK_N  <= is_active;  

    -- Coordenadas para a PPU
    pixel_x <= std_logic_vector(to_unsigned(h_count, 10)) when is_active = '1' else (others => '0');
    pixel_y <= std_logic_vector(to_unsigned(v_count, 10)) when is_active = '1' else (others => '0');

    -- Buffer de Saída, forçando tudo preto fora da área ativa
    VGA_R <= r_in when is_active = '1' else (others => '0');
    VGA_G <= g_in when is_active = '1' else (others => '0');
    VGA_B <= b_in when is_active = '1' else (others => '0');

end arch;