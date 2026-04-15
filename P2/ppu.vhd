library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ppu is
    port (
        clk         : in  std_logic;
        pixel_x     : in  integer;
        pixel_y     : in  integer;
        video_on    : in  std_logic;
        
        ball_x      : in  integer;
        ball_y      : in  integer;
        p1_x        : in  integer;
        p2_x        : in  integer;
        
        -- CORREÇÃO: Adicionadas saídas individuais conforme solicitado anteriormente
        r_out       : out std_logic_vector(7 downto 0);
        g_out       : out std_logic_vector(7 downto 0);
        b_out       : out std_logic_vector(7 downto 0)
    );
end ppu;

architecture structural of ppu is
    signal s_sprite_on        : std_logic;
    signal s_sprite_id        : integer range 0 to 3;
    signal s_sprite_rom_addr  : integer range 0 to 1023;
    signal s_sprite_color_idx : integer range 0 to 3;
    
    signal s_bg_tile_id       : std_logic_vector(7 downto 0);
    
    -- CORREÇÃO: Alterado para std_logic_vector para coincidir com tileset_memory
    signal s_bg_color_vec     : std_logic_vector(7 downto 0);
    -- Sinal auxiliar para converter para integer para o seletor
    signal s_bg_color_idx     : integer range 0 to 3;
    
    signal s_final_color_idx  : integer range 0 to 3;

begin

    -- 1. Camada de Sprites
    SPRITE_MEM: entity work.sprite_memory
        port map (
            pixel_x   => pixel_x,
            pixel_y   => pixel_y,
            ball_x    => ball_x,
            ball_y    => ball_y,
            p1_x      => p1_x,
            p2_x      => p2_x,
            pixel_on  => s_sprite_on,
            sprite_id => s_sprite_id,
            rom_addr  => s_sprite_rom_addr
        );

    -- 2. Camada de Sprites: Bitmap
    SPRITE_BTMP: entity work.sprite_bitmap
        port map (
            clk       => clk,
            sprite_id => s_sprite_id,
            rom_addr  => s_sprite_rom_addr,
            color_idx => s_sprite_color_idx
        );

    -- 3. Camada de Background: Mapa de Tiles
    BG_RAM: entity work.background_ram
        port map (
            clk     => clk,
            x_pixel => std_logic_vector(to_unsigned(pixel_x, 10)),
            y_pixel => std_logic_vector(to_unsigned(pixel_y, 10)),
            wr      => '0',
            data_in => (others => '0'),
            tile_id => s_bg_tile_id
        );

    -- 4. Camada de Background: Memória de Tileset
    BG_TILESET: entity work.tileset_memory
        port map (
            clk         => clk,
            x_pixel     => std_logic_vector(to_unsigned(pixel_x, 10)),
            y_pixel     => std_logic_vector(to_unsigned(pixel_y, 10)),
            tile_id     => s_bg_tile_id,
            wr          => '0',
            data_in     => (others => '0'),
            pixel_data  => s_bg_color_vec -- Conectado ao vetor de 8 bits
        );

    -- Conversão explícita de std_logic_vector para integer para o seletor
    s_bg_color_idx <= to_integer(unsigned(s_bg_color_vec(1 downto 0)));

    -- 5. Seletor de Camadas
    SELECTOR: entity work.pixel_selector
        port map (
            sprite_on        => s_sprite_on,
            sprite_color_idx => s_sprite_color_idx,
            bg_color_idx     => s_bg_color_idx,
            final_color_idx  => s_final_color_idx
        );

    -- 6. Tradutor de Cores
    PALETTE: entity work.color_palette
        port map (
            color_idx => s_final_color_idx,
            video_on  => video_on,
            r_out     => r_out,
            g_out     => g_out,
            b_out     => b_out
        );

end structural;