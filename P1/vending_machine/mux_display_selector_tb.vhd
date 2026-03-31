library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mux_display_selector is
-- Testbench não possui portas
end entity;

architecture behavior of mux_display_selector_tb is

    -- Component Declaration para o UUT (Unit Under Test)
    component mux_display_selector
        port (
            estado          : in  std_logic_vector(2 downto 0);
            saldo_restante  : in  std_logic_vector(10 downto 0);
            valor_troco     : in  std_logic_vector(10 downto 0);
            valor_acumulado : in  std_logic_vector(10 downto 0);
            saida_bin       : out std_logic_vector(10 downto 0)
        );
    end component;

    -- Sinais internos para conectar ao UUT
    signal s_estado          : std_logic_vector(2 downto 0) := "000";
    signal s_saldo_restante  : std_logic_vector(10 downto 0) := "00001100100"; -- 100
    signal s_valor_troco     : std_logic_vector(10 downto 0) := "00000011001"; -- 25
    signal s_valor_acumulado : std_logic_vector(10 downto 0) := "00000110010"; -- 50
    signal s_saida_bin       : std_logic_vector(10 downto 0);

begin

    -- Instância da Unidade Sob Teste (UUT)
    uut: mux_display_selector
        port map (
            estado          => s_estado,
            saldo_restante  => s_saldo_restante,
            valor_troco     => s_valor_troco,
            valor_acumulado => s_valor_acumulado,
            saida_bin       => s_saida_bin
        );

    -- Processo de estímulo
    stim_proc: process
    begin
        -- Nota: Como é um circuito combinacional, não precisamos de clock,
        -- apenas mudar as entradas e esperar um tempo para observar.

        -- Teste Estado 000 (Saldo Restante)
        s_estado <= "000";
        wait for 20 ns;
        
        -- Teste Estado 001 (Saldo Restante)
        s_estado <= "001";
        wait for 20 ns;

        -- Teste Estado 010 (Saldo Restante)
        s_estado <= "010";
        wait for 20 ns;

        -- Teste Estado 011 (Valor Acumulado)
        s_estado <= "011";
        wait for 20 ns;

        -- Teste Estado 100 (Valor Troco)
        s_estado <= "100";
        wait for 20 ns;

        -- Teste Outros Estados (deve zerar a saída)
        s_estado <= "111";
        wait for 20 ns;

        -- Finaliza a simulação
        wait;
    end process;

end architecture;
