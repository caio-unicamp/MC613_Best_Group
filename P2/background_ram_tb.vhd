library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_background_ram_full is
end entity;

architecture sim of tb_background_ram_full is

    signal clk      : std_logic := '0';
    signal x_pixel  : std_logic_vector(9 downto 0) := (others => '0');
    signal y_pixel  : std_logic_vector(9 downto 0) := (others => '0');
    signal wr       : std_logic := '0';
    signal data_in  : std_logic_vector(7 downto 0) := (others => '0');
    signal tile_id  : std_logic_vector(7 downto 0);

    constant CLK_PERIOD : time := 20 ns;

begin

    uut: entity work.background_ram
        port map (
            clk     => clk,
            x_pixel => x_pixel,
            y_pixel => y_pixel,
            wr      => wr,
            data_in => data_in,
            tile_id => tile_id
        );

    -- Clock de 50MHz
    clk <= not clk after CLK_PERIOD / 2;

    stim_proc: process
    begin
        -- Reset inicial
        wr <= '0';
        x_pixel <= (others => '0');
        y_pixel <= (others => '0');
        wait for 100 ns;

        -----------------------------------------------------------------------
        -- TESTE 1: Varredura de Leitura dos Dados Iniciais (MAP_DATA)
        -----------------------------------------------------------------------
        report "Iniciando varredura de leitura do MAP_DATA...";
        
        -- Vamos testar os primeiros 20 tiles (primeira linha teórica)
        -- Cada tile tem 32 pixels de largura (2^5)
        for i in 0 to 19 loop
            x_pixel <= std_logic_vector(to_unsigned(i * 32, 10));
            y_pixel <= std_logic_vector(to_unsigned(0, 10)); -- Primeira linha
            wait for CLK_PERIOD;
            
            -- O MAP_DATA diz que de 0 a 119 é x"00"
            assert (tile_id = x"00") 
                report "Erro na leitura inicial: indice " & integer'image(i) & " deveria ser 00"
                severity error;
        end loop;

        -----------------------------------------------------------------------
        -- TESTE 2: Escrita em Massa (Preenchendo uma 'linha' com valores crescentes)
        -----------------------------------------------------------------------
        report "Iniciando escrita em massa na linha 5...";
        wr <= '1';
        y_pixel <= std_logic_vector(to_unsigned(5 * 32, 10)); -- Linha 5 (índice começa em 100)
        
        for i in 0 to 19 loop
            x_pixel <= std_logic_vector(to_unsigned(i * 32, 10));
            data_in <= std_logic_vector(to_unsigned(i + 160, 8)); -- Valor arbitrário
            wait for CLK_PERIOD;
        end loop;
        
        wr <= '0';
        wait for CLK_PERIOD;

        -----------------------------------------------------------------------
        -- TESTE 3: Verificação da Escrita (Leitura do que acabamos de escrever)
        -----------------------------------------------------------------------
        report "Verificando dados escritos...";
        for i in 0 to 19 loop
            x_pixel <= std_logic_vector(to_unsigned(i * 32, 10));
            y_pixel <= std_logic_vector(to_unsigned(5 * 32, 10));
            wait for CLK_PERIOD;
            
            assert (tile_id = std_logic_vector(to_unsigned(i + 160, 8)))
                report "Erro na verificacao: valor lido nao confere na posicao " & integer'image(i)
                severity error;
        end loop;

        -----------------------------------------------------------------------
        -- TESTE 4: Teste de Limite (Bordas da Memória)
        -----------------------------------------------------------------------
        report "Testando ultimo endereco da RAM (indice 299)...";
        -- Indice 299 = Linha 14, Coluna 19 -> (14 * 20) + 19 = 299
        y_pixel <= std_logic_vector(to_unsigned(14 * 32, 10));
        x_pixel <= std_logic_vector(to_unsigned(19 * 32, 10));
        wr <= '1';
        data_in <= x"FF";
        wait for CLK_PERIOD;
        wr <= '0';
        wait for CLK_PERIOD;
        
        assert (tile_id = x"FF") report "Erro no teste de limite superior!" severity error;

        report "Fim da varredura completa. Se nao houve mensagens de erro, sua RAM esta perfeita!";
        wait;
    end process;

end architecture;