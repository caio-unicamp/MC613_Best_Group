library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_testing is
    port (
        MAX10_CLK1_50 : in  std_logic;                     -- Clock de 50MHz da DE1-SoC
        KEY           : in  std_logic_vector(0 downto 0);  -- Botão 0 para Reset
        
        -- Pinos Físicos da VGA na DE1-SoC
        VGA_R         : out std_logic_vector(7 downto 0);
        VGA_G         : out std_logic_vector(7 downto 0);
        VGA_B         : out std_logic_vector(7 downto 0);
        VGA_HS        : out std_logic;
        VGA_VS        : out std_logic;
        VGA_BLANK_N   : out std_logic;
        VGA_SYNC_N    : out std_logic;
        VGA_CLK       : out std_logic
    );
end top_testing;

architecture structural of top_testing is
    -- Sinais de Interconexão
    signal clk_25_175   : std_logic;
    signal w_pixel_x    : std_logic_vector(9 downto 0);
    signal w_pixel_y    : std_logic_vector(9 downto 0);
    signal w_video_on   : std_logic;
    signal pll_locked   : std_logic;
    signal w_r, w_g, w_b : std_logic_vector(7 downto 0);

    -- Posições Estáticas para o Teste
    constant STATIC_BALL_X : integer := 304; -- Centralizado (640/2 - 32/2)
    constant STATIC_BALL_Y : integer := 224; -- Centralizado
    constant STATIC_P1_X   : integer := 272; -- Paddle 1 centralizado horizontalmente
    constant STATIC_P2_X   : integer := 272; -- Paddle 2 centralizado horizontalmente
	 
	 component pll is
    port (
        refclk   : in  std_logic;
        rst      : in  std_logic;
        outclk_0 : out std_logic;
        locked   : out std_logic
    );
	end component;

begin

    -- 1. Instância do PLL (Gera 25.175 MHz a partir de 50 MHz)
    -- Você deve criar este componente no Quartus IP Catalog
PLL_INST : pll 
    port map (
        refclk   => MAX10_CLK1_50,
        rst      => not KEY(0),
        outclk_0 => clk_25_175,
        locked   => pll_locked
    );
    -- 2. VGA Controller: Gerencia temporização e varredura
    VGA_CTRL : entity work.vga_controller
        port map (
            pixel_clk    => clk_25_175,
            reset_n      => KEY(0),
            -- Cores vindas da PPU
            r_in         => w_r,
            g_in         => w_g,
            b_in         => w_b,
            -- Sinais de controle enviados para a PPU
            pixel_x      => w_pixel_x,
            pixel_y      => w_pixel_y,
            video_active => w_video_on,
            -- Conexão com pinos físicos
            VGA_R        => VGA_R,
            VGA_G        => VGA_G,
            VGA_B        => VGA_B,
            VGA_HS       => VGA_HS,
            VGA_VS       => VGA_VS,
            VGA_BLANK_N  => VGA_BLANK_N,
            VGA_SYNC_N   => VGA_SYNC_N,
            VGA_CLK      => VGA_CLK
        );

    -- 3. PPU: Processa a imagem (Background + Sprites)
    PPU_INST : entity work.ppu
        port map (
            clk      => clk_25_175,
            pixel_x  => to_integer(unsigned(w_pixel_x)),
            pixel_y  => to_integer(unsigned(w_pixel_y)),
            video_on => w_video_on,
            
            -- Injeção de posições estáticas para o teste de imagem
            ball_x   => STATIC_BALL_X,
            ball_y   => STATIC_BALL_Y,
            p1_x     => STATIC_P1_X,
            p2_x     => STATIC_P2_X,
            
            -- Saída separada de cores (conforme modificado na color_palette)
            r_out    => w_r,
            g_out    => w_g,
            b_out    => w_b
        );

end structural;