library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity acumulador is
    Port (
        clk             : in  STD_LOGIC;
        reset           : in  STD_LOGIC;
        
        -- Sinais de Controle (vindos da Máquina de Estados)
        en_acumula      : in  STD_LOGIC; -- Disparado quando pulso_out = '1' e moeda_valida = '1'
        clr_acumula     : in  STD_LOGIC; -- Para zerar tudo após um cancelamento ou conclusão de venda
        
        -- Sinais de Dados
        valor_produto   : in  STD_LOGIC_VECTOR(10 downto 0); -- Vem do módulo produto_valor
        valor_moeda     : in  STD_LOGIC_VECTOR(10 downto 0); -- Vem do decode_moedas
        
        -- Saídas para os Displays (A passar pelo Double Dabble)
        saldo_restante  : out STD_LOGIC_VECTOR(10 downto 0);
        valor_troco     : out STD_LOGIC_VECTOR(10 downto 0);
        valor_acumulado : out STD_LOGIC_VECTOR(10 downto 0); -- Útil para exibir durante o cancelamento
        
        -- Status para a FSM
        venda_concluida : out STD_LOGIC
    );
end acumulador;

architecture Behavioral of acumulador is
    signal acumulador : unsigned(10 downto 0) := (others => '0');
    signal preco_prod : unsigned(10 downto 0);
begin
    preco_prod <= unsigned(valor_produto);
    valor_acumulado <= std_logic_vector(acumulador);

    -- Registrador que acumula o dinheiro inserido
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' or clr_acumula = '1' then
                acumulador <= (others => '0');
            elsif en_acumula = '1' then
                acumulador <= acumulador + unsigned(valor_moeda);
            end if;
        end if;
    end process;

    -- Lógica Combinacional para Saldo e Troco
    process(acumulador, preco_prod)
    begin
        -- Valores padrão
        venda_concluida <= '0';
        saldo_restante  <= std_logic_vector(preco_prod - acumulador);
        valor_troco     <= (others => '0');

        -- Verifica se o valor inserido já cobriu o preço
        if acumulador >= preco_prod then
            venda_concluida <= '1';
            saldo_restante  <= (others => '0'); -- O saldo zera (não fica negativo)
            valor_troco     <= std_logic_vector(acumulador - preco_prod);
        end if;
    end process;

end Behavioral;