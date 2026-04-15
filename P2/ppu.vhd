library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ppu is
    port (
        clk         : in  std_logic;
        -- Coordenadas do VGA Controller
        pixel_x     : in  integer;
        pixel_y     : in  integer;
        video_on    : in  std_logic;
        
        -- Interface com a Lógica de Jogo (Posições dos Sprites)
        ball_x      : in  integer;
        ball_y      : in  integer;
        p1_x        : in  integer;
        p2_x        : in  integer;
        
        -- Saída Final
        rgb         : out std_logic_vector(11 downto 0)
    );
end ppu;

architecture structural of ppu is
    -- Sinais internos para interconexão
    signal s_sprite_on        : std_logic;
    signal s_sprite_id        : integer range 0 to 3;
    signal s_sprite_rom_addr  : integer range 0 to 1023;
    signal s_sprite_color_idx : integer range 0 to 3;
    
    signal s_bg_tile_id       : std_logic_vector(7 downto 0);
    signal s_bg_color_idx     : integer range 0 to 3;
    
    signal s_final_color_idx  : integer range 0 to 3;

begin

    -- 1. Camada de Sprites: Lógica de Memória e Posicionamento
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

    -- 2. Camada de Sprites: Bitmap/ROM
    SPRITE_BTMP: entity work.sprite_bitmap
        port map (
            clk       => clk,
            sprite_id => s_sprite_id,
            rom_addr  => s_sprite_rom_addr,
            color_idx => s_sprite_color_idx
        );

    -- 3. Camada de Background: Mapa de Tiles (RAM)
    BG_RAM: entity work.background_ram
        port map (
            clk     => clk,
            x_pixel => std_logic_vector(to_unsigned(pixel_x, 10)),
            y_pixel => std_logic_vector(to_unsigned(pixel_y, 10)),
            wr      => '0', -- Apenas leitura para a PPU
            data_in => (others => '0'),
            tile_id => s_bg_tile_id
        );

    -- 4. Camada de Background: Desenho dos Tiles (ROM)
    -- Este é o módulo que faltava para converter o ID do tile em cor
    BG_BTMP: entity work.tile_bitmap
        port map (
            clk       => clk,
            tile_id   => to_integer(unsigned(s_bg_tile_id)),
            pixel_x   => pixel_x,
            pixel_y   => pixel_y,
            color_idx => s_bg_color_idx
        );

    -- 5. Seletor de Camadas (Interceptor e Prioridade)
    SELECTOR: entity work.pixel_selector
        port map (
            sprite_on        => s_sprite_on,
            sprite_color_idx => s_sprite_color_idx,
            bg_color_idx     => s_bg_color_idx,
            final_color_idx  => s_final_color_idx
        );

    -- 6. Tradutor de Cores (Paleta Final)
    PALETTE: entity work.color_palette
        port map (
            color_idx => s_final_color_idx,
            video_on  => video_on,
            rgb_out   => rgb
        );

end structural;