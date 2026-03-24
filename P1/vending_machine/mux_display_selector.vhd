library ieee;
use ieee.std_logic_1164.all;

entity mux_display_selector is
    port (
        estado      		: in  std_logic_vector(2 downto 0); -- Estado em que o processo se encontra, recebido pela máquina de estados para escolher o que será exibido no display de 7 segmentos
        saldo_restante      : in  std_logic_vector(10 downto 0);
        valor_troco 		: in  std_logic_vector(10 downto 0);
        valor_acumulado     : in  std_logic_vector(10 downto 0);
        saida_bin   		: out std_logic_vector(10 downto 0) -- Saída que irá para o conversor bin2bcd
    );
end entity;

architecture rtl of mux_display_selector is
begin
    process(all)
    begin
        case estado is
            when "000" => -- Estado de escolher produto
                saida_bin <= saldo_restante;
				when "001" => -- Estado de inserir dinheiro
                saida_bin <= saldo_restante;
            when "010" => -- Estado de dispensar
                saida_bin <= saldo_restante;
				when "011" => -- Estado de devolver cancelamento
                saida_bin <= valor_acumulado;
				when "100" => -- Estado de devolver troco
                saida_bin <= valor_troco;
            when others =>
                saida_bin <= (others => '0');
        end case;
    end process;
end architecture;