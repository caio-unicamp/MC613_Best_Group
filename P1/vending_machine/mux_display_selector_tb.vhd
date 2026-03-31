library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_display_selector_tb is
end entity;

architecture behavior of mux_display_selector_tb is

    component mux_display_selector
        port (
            estado          : in  std_logic_vector(2 downto 0);
            saldo_restante  : in  std_logic_vector(10 downto 0);
            valor_troco     : in  std_logic_vector(10 downto 0);
            valor_acumulado : in  std_logic_vector(10 downto 0);
            saida_bin       : out std_logic_vector(10 downto 0)
        );
    end component;

    signal s_estado          : std_logic_vector(2 downto 0) := "000";
    signal s_saldo_restante  : std_logic_vector(10 downto 0) := "00001100100"; -- 100
    signal s_valor_troco     : std_logic_vector(10 downto 0) := "00000011001"; -- 25
    signal s_valor_acumulado : std_logic_vector(10 downto 0) := "00000110010"; -- 50
    signal s_saida_bin       : std_logic_vector(10 downto 0);

begin

    uut: mux_display_selector
        port map (
            estado          => s_estado,
            saldo_restante  => s_saldo_restante,
            valor_troco     => s_valor_troco,
            valor_acumulado => s_valor_acumulado,
            saida_bin       => s_saida_bin
        );

    stim_proc: process
    begin
        report "--- Iniciando Teste do Mux ---";

        -- Teste Estado 000
        s_estado <= "000";
        wait for 10 ns;
        report "Estado 000 (Saldo) -> Saida: " & integer'image(to_integer(unsigned(s_saida_bin)));
        
        -- Teste Estado 011
        s_estado <= "011";
        wait for 10 ns;
        report "Estado 011 (Acumulado) -> Saida: " & integer'image(to_integer(unsigned(s_saida_bin)));

        -- Teste Estado 100
        s_estado <= "100";
        wait for 10 ns;
        report "Estado 100 (Troco) -> Saida: " & integer'image(to_integer(unsigned(s_saida_bin)));

        -- Teste Outros
        s_estado <= "111";
        wait for 10 ns;
        report "Estado Others (Zero) -> Saida: " & integer'image(to_integer(unsigned(s_saida_bin)));

        report "--- Fim do Teste ---";
        wait;
    end process;

end architecture;
