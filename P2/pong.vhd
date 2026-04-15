LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY de1_soc_vga_top IS
    PORT (
        CLOCK_50    : IN  STD_LOGIC;
        KEY         : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        SW          : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
        
        -- Saídas VGA (Nomes padrão da DE1-SoC)
        VGA_R       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        VGA_G       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        VGA_B       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        VGA_HS      : OUT STD_LOGIC;
        VGA_VS      : OUT STD_LOGIC;
        VGA_BLANK_N : OUT STD_LOGIC;
        VGA_SYNC_N  : OUT STD_LOGIC;
        VGA_CLK     : OUT STD_LOGIC
    );
END de1_soc_vga_top;

ARCHITECTURE structural OF de1_soc_vga_top IS
    -- Sinais internos para interconexão
    signal w_pixel_clk   : std_logic;
    signal w_pixel_x     : std_logic_vector(9 downto 0);
    signal w_pixel_y     : std_logic_vector(9 downto 0);
    signal w_video_active: std_logic;
    signal pll_locked    : std_logic;
    signal w_r, w_g, w_b : std_logic_vector(7 downto 0);

    signal w_reset_n     : std_logic;

    component pll is 
    port (
        refclk      : in std_logic;
        rst         : in std_logic;
        outclk_0    : out std_logic;
        locked      : out std_logic
    );

BEGIN

    w_reset_n <= '0' when (SW(0) = '1' and KEY(0) = '0') else '1';

    -- 1. INSTÂNCIA DO PLL (Você deve gerar este componente no Quartus IP Catalog)
    -- O nome 'my_pll' deve ser o mesmo que você deu ao gerar o arquivo .vhd
    pll_inst : entity work.pll 
        port map (
            refclk   => CLOCK_50,
            rst      => not KEY(0),  -- KEY é active-low, PLL costuma ser active-high
            outclk_0 => w_pixel_clk,  -- Saída de 25.175 MHz
            locked => pll_locked
        );

    -- 2. INSTÂNCIA DA PPU
    ppu_inst : entity work.ppu
        port map (
            pixel_x      => w_pixel_x,
            pixel_y      => w_pixel_y,
            video_active => w_video_active,
            r            => w_r,
            g            => w_g,
            b            => w_b
        );

    -- 3. INSTÂNCIA DO SEU VGA CONTROLLER
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

END structural;
