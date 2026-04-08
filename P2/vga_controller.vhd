LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY VGA_Controller IS
  port (
    -- Entradas de Controle de Clock e Reset
    pixel_clk    : IN  STD_LOGIC;                     -- Clock de 25.175 MHz gerado pelo PLL
    reset_n      : IN  STD_LOGIC;                     -- Reset assíncrono (ativo baixo)

    -- Entradas de Cor (vindos da PPU)
    r_in         : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Intensidade do vermelho do pixel atual
    g_in         : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Intensidade do verde do pixel atual
    b_in         : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Intensidade do azul do pixel atual

    -- Saídas de Controle Interno (enviados para a PPU)
    pixel_x      : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);  -- Coordenada X atual
    pixel_y      : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);  -- Coordenada Y atual
    video_active : OUT STD_LOGIC;                     -- '1' se estiver dentro da área visível (Active Video)

    -- Saídas Físicas (conectadas aos pinos da DE1-SoC)
    VGA_R        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Saída VGA Vermelha
    VGA_G        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Saída VGA Verde
    VGA_B        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Saída VGA Azul
    VGA_HS       : OUT STD_LOGIC;                     -- Sincronismo Horizontal
    VGA_VS       : OUT STD_LOGIC;                     -- Sincronismo Vertical
    VGA_BLANK_N  : OUT STD_LOGIC;                     -- Fora da área visível (ou seja, deve ser '0' no blanking)
    VGA_SYNC_N   : OUT STD_LOGIC;                     -- Sincronização de vídeo (fixo em '1')
    VGA_CLK      : OUT STD_LOGIC                      -- Clock do pixel (espelho do pixel_clk)
  );
END VGA_Controller;

ARCHITECTURE arch OF VGA_Controller IS
    -- Constantes para 640x480 @ 60Hz
    CONSTANT H_ACTIVE : INTEGER := 640;
    CONSTANT H_FP     : INTEGER := 16;
    CONSTANT H_SYNC   : INTEGER := 96;
    CONSTANT H_BP     : INTEGER := 48;
    CONSTANT H_TOTAL  : INTEGER := 800;

    CONSTANT V_ACTIVE : INTEGER := 480;
    CONSTANT V_FP     : INTEGER := 10;
    CONSTANT V_SYNC   : INTEGER := 2;
    CONSTANT V_BP     : INTEGER := 33;
    CONSTANT V_TOTAL  : INTEGER := 525;

    SIGNAL h_count : INTEGER RANGE 0 TO H_TOTAL - 1 := 0;
    SIGNAL v_count : INTEGER RANGE 0 TO V_TOTAL - 1 := 0;
    SIGNAL is_active : STD_LOGIC;
BEGIN
    VGA_CLK    <= pixel_clk;
    VGA_SYNC_N <= '1'; -- Conforme enunciado

    -- Contadores de Varredura
    PROCESS(pixel_clk, reset_n)
    BEGIN
        IF reset_n = '0' THEN
            h_count <= 0;
            v_count <= 0;
        ELSIF rising_edge(pixel_clk) THEN
            IF h_count = H_TOTAL - 1 THEN
                h_count <= 0;
                IF v_count = V_TOTAL - 1 THEN
                    v_count <= 0;
                ELSE
                    v_count <= v_count + 1;
                END IF;
            ELSE
                h_count <= h_count + 1;
            END IF;
        END IF;
    END PROCESS;

    -- Geração de Sincronismo (Polaridade Negativa para 480p)
    VGA_HS <= '0' WHEN (h_count >= (H_ACTIVE + H_FP)) AND (h_count < (H_ACTIVE + H_FP + H_SYNC)) ELSE '1';
    VGA_VS <= '0' WHEN (v_count >= (V_ACTIVE + V_FP)) AND (v_count < (V_ACTIVE + V_FP + V_SYNC)) ELSE '1';

    -- Sinais de Controle de Vídeo
    is_active <= '1' WHEN (h_count < H_ACTIVE) AND (v_count < V_ACTIVE) ELSE '0';
    video_active <= is_active;
    VGA_BLANK_N  <= is_active;

    -- Coordenadas para a PPU
    pixel_x <= std_logic_vector(to_unsigned(h_count, 10)) WHEN is_active = '1' ELSE (OTHERS => '0');
    pixel_y <= std_logic_vector(to_unsigned(v_count, 10)) WHEN is_active = '1' ELSE (OTHERS => '0');

    -- Buffer de Saída: Força preto fora da área ativa
    VGA_R <= r_in WHEN is_active = '1' ELSE (OTHERS => '0');
    VGA_G <= g_in WHEN is_active = '1' ELSE (OTHERS => '0');
    VGA_B <= b_in WHEN is_active = '1' ELSE (OTHERS => '0');

END arch;