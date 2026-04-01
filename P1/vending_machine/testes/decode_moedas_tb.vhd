library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decode_moedas_tb is
    -- Testbench não possui portas
end decode_moedas_tb;

architecture sim of decode_moedas_tb is

    -- Sinais internos para conectar ao componente (UUT)
    signal s_sw_moedas    : STD_LOGIC_VECTOR(9 downto 4) := (others => '0');
    signal s_valor_moeda  : STD_LOGIC_VECTOR(10 downto 0);
    signal s_moeda_valida : STD_LOGIC;

begin

    -- Instanciação da Unidade sob Teste (UUT)
    uut: entity work.decode_moedas
        port map (
            sw_moedas    => s_sw_moedas,
            valor_moeda  => s_valor_moeda,
            moeda_valida => s_moeda_valida
        );

    -- Processo de estímulo
    stim_proc: process
    begin
        -- Caso 1: Nenhuma moeda selecionada (Invalido)
        s_sw_moedas <= "000000";
        wait for 10 ns;

        -- Caso 2: Moeda de 5 centavos [cite: 3, 4]
        s_sw_moedas <= "000001";
        wait for 10 ns;

        -- Caso 3: Moeda de 10 centavos [cite: 5]
        s_sw_moedas <= "000010";
        wait for 10 ns;

        -- Caso 4: Moeda de 25 centavos [cite: 6]
        s_sw_moedas <= "000100";
        wait for 10 ns;

        -- Caso 5: Moeda de 50 centavos [cite: 7]
        s_sw_moedas <= "001000";
        wait for 10 ns;

        -- Caso 6: Moeda de 1 Real (100 centavos) [cite: 8]
        s_sw_moedas <= "010000";
        wait for 10 ns;

        -- Caso 7: Moeda de 2 Reais (200 centavos) [cite: 9]
        s_sw_moedas <= "100000";
        wait for 10 ns;

        -- Caso 8: Entrada inválida (Múltiplas chaves ou valor não mapeado) 
        s_sw_moedas <= "110000";
        wait for 10 ns;

        -- Finaliza a simulação
        wait;
    end process;

end sim;