library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity background_ram_tb is
end entity;

architecture sim of background_ram_tb is
    -- Sinais para conectar no componente
    signal clk     : std_logic := '0';
    signal x_pixel : std_logic_vector(9 downto 0) := (others => '0');
    signal y_pixel : std_logic_vector(9 downto 0) := (others => '0');
    signal wr      : std_logic := '0';
    signal data_in : std_logic_vector(7 downto 0) := (others => '0');
    signal tile_id : std_logic_vector(7 downto 0);

    constant clk_period : time := 10 ns;
begin

    -- Instância da RAM
    UUT: entity work.background_ram
        port map (
            clk => clk, x_pixel => x_pixel, y_pixel => y_pixel,
            wr => wr, data_in => data_in, tile_id => tile_id
        );

    -- Gerador de clock (50MHz simulado)
    clk <= not clk after clk_period/2;

    -- Processo de estímulo
    process
    begin
        -- Testa se lê o Tile(0,0) na inicialização
        x_pixel <= std_logic_vector(to_unsigned(0, 10));
        y_pixel <= std_logic_vector(to_unsigned(0, 10));
        wait for 20 ns;

        -- Muda para o pixel (31, 0) - Ainda deve ser o Tile(0,0)
        x_pixel <= std_logic_vector(to_unsigned(31, 10));
        wait for 20 ns;

        -- Mudar para o pixel (32, 0) - Deve pular para o Tile(1,0) -> Endereço 1
        x_pixel <= std_logic_vector(to_unsigned(32, 10));
        wait for 20 ns;

        -- Testa escrita: vamos escrever o ID 42 na posição (0,0)
        wr <= '1';
        x_pixel <= (others => '0');
        y_pixel <= (others => '0');
        data_in <= std_logic_vector(to_unsigned(42, 8));
        wait for 10 ns; -- espera subir o clock
        
        -- Volta para leitura e ver se o 42 aparece
        wr <= '0';
        wait for 20 ns;

        wait; -- Finaliza a simulação
    end process;
end architecture;