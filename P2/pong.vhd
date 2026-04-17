library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity de1_soc_vga_top is
    port (
        CLOCK_50    : in  STD_LOGIC;
        KEY         : in  STD_LOGIC_VECTOR(3 downto 0);
        SW          : in  STD_LOGIC_VECTOR(9 downto 0);
        
        -- Saídas VGA (Nomes padrão da DE1-SoC)
        VGA_R, VGA_G, VGA_B : out STD_LOGIC_VECTOR(7 downto 0);
        VGA_HS      : out STD_LOGIC;
        VGA_VS      : out STD_LOGIC;
        VGA_BLANK_N : out STD_LOGIC;
        VGA_SYNC_N  : out STD_LOGIC;
        VGA_CLK     : out STD_LOGIC;
        -- Saídas dos displays para exibir pontos dos jogadores
        HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out STD_LOGIC_VECTOR(6 downto 0)   
    );
end de1_soc_vga_top;

ARCHITECTURE structural of de1_soc_vga_top is
    -- Sinais internos para interconexão
    signal w_pixel_clk   : std_logic;
    signal w_pixel_x     : std_logic_vector(9 downto 0);
    signal w_pixel_y     : std_logic_vector(9 downto 0);
    signal w_video_active: std_logic;
    signal pll_locked    : std_logic;
    signal w_r, w_g, w_b : std_logic_vector(7 downto 0);

    signal w_reset_n     : std_logic;

    signal w_p1_x, w_p2_x, w_ball_x : integer range 0 to 639;
    signal w_ball_y : integer range 0 to 479;
    -- Sinais dos scores
    signal w_score1, w_score2 : std_logic_vector(7 downto 0);
    signal w_bcd_p1, w_bcd_p2 : std_logic_vector(15 downto 0);

    component pll is 
    port (
        refclk      : in std_logic;
        rst         : in std_logic;
        outclk_0    : out std_logic;
        locked      : out std_logic
    );
    end component;

begin

    w_reset_n <= '0' when (SW(0) = '1' and KEY(0) = '0') else '1';

    -- instância do PLL gerado pelo quartus
    pll_inst : pll 
        port map (
            refclk   => CLOCK_50,
            rst      => not KEY(0),  -- KEY é active-low, PLL costuma ser active-high
            outclk_0 => w_pixel_clk,  -- Saída de 25.175 MHz
            locked => pll_locked
        );

    -- instância da PPU
    ppu_inst : entity work.ppu
        port map (
            clk          => w_pixel_clk,
            pixel_x      => to_integer(unsigned(w_pixel_x)),
            pixel_y      => to_integer(unsigned(w_pixel_y)),
            video_on     => w_video_active,
            ball_x       => w_ball_x,
            ball_y       => w_ball_y,
            p1_x         => w_p1_x,
            p2_x         => w_p2_x,
            r_out        => w_r,
            g_out        => w_g,
            b_out        => w_b
        );

    -- instância do controlador de VGA
    vga_inst : entity work.vga_controller
        port map (
            pixel_clk    => w_pixel_clk,
            reset_n      => w_reset_n,
            r_in         => w_r,
            g_in         => w_g,
            b_in         => w_b,
            pixel_x      => w_pixel_x,
            pixel_y      => w_pixel_y,
            video_active => w_video_active,
            VGA_R        => VGA_R,
            VGA_G        => VGA_G,
            VGA_B        => VGA_B,
            VGA_HS       => VGA_HS,
            VGA_VS       => VGA_VS,
            VGA_BLANK_N  => VGA_BLANK_N,
            VGA_SYNC_N   => VGA_SYNC_N,
            VGA_CLK      => VGA_CLK
        );
    -- Instância da lógica do jogo
    logic_inst : entity work.game_logic
    port map (
        pixel_clk => w_pixel_clk, -- Ou w_pixel_clk
        reset_n   => w_reset_n,
        key       => KEY,
        p1_x      => w_p1_x, p2_x => w_p2_x,
        ball_x    => w_ball_x, ball_y => w_ball_y,
        score1    => unsigned(w_score1), score2 => unsigned(w_score2)
    );

    -- Instância do conversor bin2bcd , preenchendo os 8 bits do placar com "000" para adequar aos 11 bits do bin11_to_bcd4
    bcd_conv_p1: entity work.bin11_to_bcd4
    port map (
        bin => "000" & std_logic_vector(w_score1),
        bcd => w_bcd_p1
    );

    bcd_conv_p2: entity work.bin11_to_bcd4
    port map (
        bin => "000" & std_logic_vector(w_score2),
        bcd => w_bcd_p2
    );

    -- Jogador 1 (Topo) nos visores da esquerda
    disp_p1_tens:  entity work.bin2hex port map (BIN => w_bcd_p1(7 downto 4), HEX => HEX5);
    disp_p1_units: entity work.bin2hex port map (BIN => w_bcd_p1(3 downto 0), HEX => HEX4);

    -- Separador dos jogadores
    HEX3 <= "0111111"; -- Caractere '-'
    HEX2 <= "0111111"; -- Caractere '-'

    -- Jogador 2 (Base) nos visores da direita
    disp_p2_tens:  entity work.bin2hex port map (BIN => w_bcd_p2(7 downto 4), HEX => HEX1);
    disp_p2_units: entity work.bin2hex port map (BIN => w_bcd_p2(3 downto 0), HEX => HEX0);
    
end structural;
