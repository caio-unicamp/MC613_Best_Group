library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sprite_bitmap_tb is
-- Entidade de testbench não possui portas
end sprite_bitmap_tb;

architecture sim of sprite_bitmap_tb is

    -- Sinais para conectar ao componente (UUT)
    signal clk       : std_logic := '0';
    signal sprite_id : integer range 0 to 3 := 0;
    signal rom_addr  : integer range 0 to 1023 := 0;
    signal color_idx : integer range 0 to 3;

    -- Definição do período do clock
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instanciação da Unidade Sob Teste (UUT)
    UUT: entity work.sprite_bitmap
        port map (
            clk       => clk,
            sprite_id => sprite_id,
            rom_addr  => rom_addr,
            color_idx => color_idx
        );

    -- Processo gerador de clock
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Processo de estímulo
    stim_proc: process
    begin
        -- Teste 1: Estado Inicial (Transparência)
        report "--- Início dos Testes de Bitmap ---";
        sprite_id <= 0;
        rom_addr <= 0;
        wait for CLK_PERIOD;
        
        -- Teste 2: Validando a BOLA (ID 1)
        -- Deve retornar Cor 2 independente do endereço
        sprite_id <= 1;
        rom_addr <= 100;
        wait for CLK_PERIOD;
        assert (color_idx = 2) report "Erro: Bola deve ser cor 2" severity error;

        -- Teste 3: Validando o PADDLE (ID 2) - Metade Superior
        -- Endereço 0 até 511 deve retornar Cor 1
        sprite_id <= 2;
        rom_addr <= 10;
        wait for CLK_PERIOD;
        assert (color_idx = 1) report "Erro: Parte superior do paddle deve ser cor 1" severity error;

        -- Teste 4: Validando o PADDLE (ID 2) - Metade Inferior
        -- Endereço 512 até 1023 deve retornar Cor 0
        rom_addr <= 600;
        wait for CLK_PERIOD;
        assert (color_idx = 0) report "Erro: Parte inferior do paddle deve ser cor 0" severity error;

        -- Teste 5: ID inválido/Others
        sprite_id <= 3;
        wait for CLK_PERIOD;
        assert (color_idx = 0) report "Erro: ID indefinido deve ser transparente (0)" severity error;

        report "--- Todos os testes concluídos com sucesso! ---";
        wait;
    end process;

end sim;