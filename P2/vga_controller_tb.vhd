LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY vga_controller_tb is
-- Testbench não possui portas
end vga_controller_tb;

ARCHITECTURE behavior of vga_controller_tb is 
    component VGA_Controller
    port(
         pixel_clk    : in  std_logic;
         reset_n      : in  std_logic;

         r_in         : in  std_logic_vector(7 downto 0);
         g_in         : in  std_logic_vector(7 downto 0);
         b_in         : in  std_logic_vector(7 downto 0);
         
         pixel_x      : out std_logic_vector(9 downto 0);
         pixel_y      : out std_logic_vector(9 downto 0);
         video_active : out std_logic;
         
         VGA_R        : out std_logic_vector(7 downto 0);
         VGA_G        : out std_logic_vector(7 downto 0);
         VGA_B        : out std_logic_vector(7 downto 0);
         VGA_HS       : out std_logic;
         VGA_VS       : out std_logic;
         VGA_BLANK_N  : out std_logic;
         VGA_SYNC_N   : out std_logic;
         VGA_CLK      : out std_logic
        );
    end component;

    -- Sinais de entrada
    signal pixel_clk : std_logic := '0';
    signal reset_n   : std_logic := '0';
    signal r_in      : std_logic_vector(7 downto 0) := (others => '0');
    signal g_in      : std_logic_vector(7 downto 0) := (others => '0');
    signal b_in      : std_logic_vector(7 downto 0) := (others => '0');

    -- Sinais de saída
    signal pixel_x      : std_logic_vector(9 downto 0);
    signal pixel_y      : std_logic_vector(9 downto 0);
    signal video_active : std_logic;
    
    signal VGA_R        : std_logic_vector(7 downto 0);
    signal VGA_G        : std_logic_vector(7 downto 0);
    signal VGA_B        : std_logic_vector(7 downto 0);
    signal VGA_HS       : std_logic;
    signal VGA_VS       : std_logic;
    signal VGA_BLANK_N  : std_logic;
    signal VGA_SYNC_N   : std_logic;
    signal VGA_CLK      : std_logic;

    -- Definição do período do clock (25.175 MHz)
    -- T = 1 / 25.175.000 ≈ 39.72 ns
    constant clk_period : time := 39.72 ns;
begin


    teste: VGA_Controller port MAP (
          pixel_clk    => pixel_clk,
          reset_n      => reset_n,
          r_in         => r_in,
          g_in         => g_in,
          b_in         => b_in,
          pixel_x      => pixel_x,
          pixel_y      => pixel_y,
          video_active => video_active,
          VGA_R        => VGA_R,
          VGA_G        => VGA_G,
          VGA_B        => VGA_B,
          VGA_HS       => VGA_HS,
          VGA_VS       => VGA_VS,
          VGA_BLANK_N  => VGA_BLANK_N,
          VGA_SYNC_N   => VGA_SYNC_N,
          VGA_CLK      => VGA_CLK
        );

    -- Processo de geração de Clock
    clk_process :process
    begin
        pixel_clk <= '0';
        wait for clk_period/2;
        pixel_clk <= '1';
        wait for clk_period/2;
    end process;

    -- Processo de Estímulo
    stim_proc: process
    begin		
        -- Reset inicial
        reset_n <= '0';
        wait for 100 ns;	
        reset_n <= '1';

        -- Aguarda o fim de um frame completo (opcional, mas bom para ver o VS)
        -- Um frame de 800x524 pixels leva aprox. 16.6ms
        wait for 20 ms;

        -- Finaliza simulação (dependendo do simulador)
        assert false report "Fim da simulação" severity failure;
        wait;
    end process;

    -- Processo para gerar padrões de cores dinâmicos (opcional)
    -- Isso ajuda a ver se r_in, g_in e b_in estão sendo passados corretamente para as saídas VGA
    color_gen: process(pixel_x, pixel_y, video_active)
    begin
        if video_active = '1' then
            -- Gera um padrão de degradê simples baseado na posição X
            r_in <= pixel_x(7 downto 0);
            g_in <= pixel_y(7 downto 0);
            b_in <= (others => '1');
        else
            r_in <= (others => '0');
            g_in <= (others => '0');
            b_in <= (others => '0');
        end if;
    end process;

end;