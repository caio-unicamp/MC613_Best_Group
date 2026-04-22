library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tileset_memory_tb is
-- Testbench não possui portas
end entity;

architecture sim of tileset_memory_tb is

    -- Sinais para conectar ao componente
    signal clk         : std_logic := '0';
    signal x_pixel     : std_logic_vector(9 downto 0) := (others => '0');
    signal y_pixel     : std_logic_vector(9 downto 0) := (others => '0');
    signal tile_id     : std_logic_vector(7 downto 0) := (others => '0');
    signal pixel_data  : std_logic_vector(7 downto 0);

    constant CLK_PERIOD : time := 40 ns;

begin

    -- Instância da Unidade Sob Teste (UUT)
    uut: entity work.tileset_memory
        port map (
            clk        => clk,
            x_pixel    => x_pixel,
            y_pixel    => y_pixel,
            tile_id    => tile_id,
            wr         => '0',          
            data_in    => (others => '0'),
            pixel_data => pixel_data
        );

    -- Geração do Clock
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Processo de Estímulo
    stim_proc: process
    begin
        -- Espera para estabilização
        wait for 100 ns;

        -- TESTE 1: TILE 0 (Tudo x"00")
        report "Analisando Tile 0...";
        tile_id <= x"00";
        -- Testa canto superior esquerdo (0,0)
        x_pixel <= std_logic_vector(to_unsigned(0, 10));
        y_pixel <= std_logic_vector(to_unsigned(0, 10));
        wait for CLK_PERIOD * 2;
        assert (pixel_data = x"00") report "Falha no Tile 0" severity error;

        -- TESTE 2: TILE 1 (Tudo x"01")
        report "Analisando Tile 1...";
        tile_id <= x"01";
        -- Testa um ponto qualquer (15,15)
        x_pixel <= std_logic_vector(to_unsigned(15, 10));
        y_pixel <= std_logic_vector(to_unsigned(15, 10));
        wait for CLK_PERIOD * 2;
        assert (pixel_data = x"01") report "Falha no Tile 1" severity error;

        -- TESTE 3: TILE 2 (Superior 0, Inferior 1)
        report "Analisando Tile 2 (Divisão Horizontal)...";
        tile_id <= x"02";
        
        -- Testa parte superior (Y=5) -> Deve ser 0
        y_pixel <= std_logic_vector(to_unsigned(5, 10));
        wait for CLK_PERIOD * 2;
        assert (pixel_data = x"00") report "Falha no Tile 2 Superior" severity error;
        
        -- Testa parte inferior (Y=20) -> Deve ser 1
        y_pixel <= std_logic_vector(to_unsigned(20, 10));
        wait for CLK_PERIOD * 2;
        assert (pixel_data = x"01") report "Falha no Tile 2 Inferior" severity error;

        -- TESTE 4: TILE 3 (Superior 1, Inferior 0)
        report "Analisando Tile 3 (Divisão Horizontal Inversa)...";
        tile_id <= x"03";
        
        -- Testa parte superior (Y=5) -> Deve ser 1
        y_pixel <= std_logic_vector(to_unsigned(5, 10));
        wait for CLK_PERIOD * 2;
        assert (pixel_data = x"01") report "Falha no Tile 3 Superior" severity error;
        
        -- Testa parte inferior (Y=20) -> Deve ser 0
        y_pixel <= std_logic_vector(to_unsigned(20, 10));
        wait for CLK_PERIOD * 2;
        assert (pixel_data = x"00") report "Falha no Tile 3 Inferior" severity error;

        -- TESTE 5: VERIFICAÇÃO DE OFFSET (Bordas de 32x32)
        report "Testando transição de endereços (X=31 para X=32)...";
        -- Se o pixel_x for 32, o x_offset (5 bits) deve voltar para 0
        -- Isso garante que o tile se repita corretamente na tela
        tile_id <= x"01";
        x_pixel <= std_logic_vector(to_unsigned(31, 10));
        wait for CLK_PERIOD;
        x_pixel <= std_logic_vector(to_unsigned(32, 10)); 
        wait for CLK_PERIOD * 2;
        -- O dado deve continuar sendo x"01" porque o offset 0 do tile 1 é x"01"
        assert (pixel_data = x"01") report "Falha na repetição do offset" severity error;

        report "Fim da análise de leitura. Verifique se houve mensagens de erro no console.";
        wait;
    end process;

end architecture;