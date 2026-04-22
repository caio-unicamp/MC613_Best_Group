library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_background_ram_read_only is
end entity;

architecture sim of tb_background_ram_read_only is

    signal clk      : std_logic := '0';
    signal x_pixel  : std_logic_vector(9 downto 0) := (others => '0');
    signal y_pixel  : std_logic_vector(9 downto 0) := (others => '0');
    signal wr       : std_logic := '0'; -- Mantido em '0' o tempo todo
    signal data_in  : std_logic_vector(7 downto 0) := (others => '0');
    signal tile_id  : std_logic_vector(7 downto 0);

    constant CLK_PERIOD : time := 20 ns;

begin

    -- Instância da RAM
    uut: entity work.background_ram
        port map (
            clk     => clk,
            x_pixel => x_pixel,
            y_pixel => y_pixel,
            wr      => wr,
            data_in => data_in,
            tile_id => tile_id
        );

    -- Clock
    clk <= not clk after CLK_PERIOD / 2;

    stim_proc: process
    begin
        report "Iniciando varredura automatizada de leitura...";
        
        -- Garante que a escrita está desativada
        wr <= '0';
        wait for 100 ns;

        -----------------------------------------------------------------------
        -- VARREDURA POR TODA A RAM (300 posições)
        -----------------------------------------------------------------------
        -- Vamos percorrer as 15 linhas (0 a 14) e as 20 colunas (0 a 19)
        -- Isso cobre os 300 endereços (15 * 20 = 300)
        
        for row in 0 to 14 loop
            for col in 0 to 19 loop
                
                -- Seta as coordenadas baseadas no tamanho do tile (32x32 pixels)
                y_pixel <= std_logic_vector(to_unsigned(row * 32, 10));
                x_pixel <= std_logic_vector(to_unsigned(col * 32, 10));
                
                wait for CLK_PERIOD;

                -- Verificação via Assert (Baseado no seu MAP_DATA)
                -- Indice atual = (row * 20) + col
                if (row * 20 + col) <= 119 then
                    assert (tile_id = x"00") report "Erro no indice " & integer'image(row*20+col) severity warning;
                elsif (row * 20 + col) >= 129 and (row * 20 + col) <= 130 then
                    assert (tile_id = x"02") report "Erro no indice " & integer'image(row*20+col) severity warning;
                elsif (row * 20 + col) >= 140 and (row * 20 + col) <= 159 then
                    assert (tile_id = x"01") report "Erro no indice " & integer'image(row*20+col) severity warning;
                end if;

            end loop;
        end loop;

        report "Varredura de leitura completa!";
        wait;
    end process;

end architecture;