library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity maquina_acumulador is
    Port (
        clk             : in  STD_LOGIC;
        clr_acumula     : in  STD_LOGIC; -- Para zerar tudo após um cancelamento ou conclusão de venda
        -- Recebido pela maquina de estados
        estado_atual    : in STD_LOGIC_VECTOR(2 downto 0); -- Usado para travar os switches em estados impróprios
        -- Sinais de Controle (vindos do top level)
        enable_acumula  : in  STD_LOGIC; -- Disparado quando pulso_out = '1' e moeda_valida = '1' (se pode prosseguir com a acumulação ou seja apenas uma moeda inserida)

        -- Sinais de Dados
        valor_produto   : in  STD_LOGIC_VECTOR(10 downto 0); -- Vem do módulo produto_valor
        valor_moeda     : in  STD_LOGIC_VECTOR(10 downto 0); -- Vem do decode_moedas
        
        -- Saídas para os Displays (A passar pelo Double Dabble)
        saldo_restante  : out STD_LOGIC_VECTOR(10 downto 0); -- Vai para a máquina de estados para indicar o estado de cancelamento normal ou com devolução
        valor_troco     : out STD_LOGIC_VECTOR(10 downto 0); -- Vai para a máquina de estados avaliar se o próximo estado será de devolver troco ou apenas liberar o produto
        valor_acumulado : out STD_LOGIC_VECTOR(10 downto 0); -- Pra exibir durante o cancelamento
        
        -- Status para a máquina de estados
        venda_concluida : out STD_LOGIC
    );
end maquina_acumulador;

architecture Behavioral of maquina_acumulador is
    signal acumulador : unsigned(10 downto 0) := (others => '0');
    signal preco_prod : unsigned(10 downto 0);
begin
    valor_acumulado <= std_logic_vector(acumulador);

    -- Registrador que acumula o dinheiro inserido
    process(clk)
    begin
        if rising_edge(clk) then
            -- Lógica para travar o preço
            if estado_atual = "000" then
                -- Enquanto estiver escolhendo, o preço segue os switches
                preco_prod <= unsigned(valor_produto);
            end if;

            -- Lógica do acumulador original
            if clr_acumula = '1' then
                acumulador <= (others => '0');
            elsif enable_acumula = '1' and estado_atual = "001" then
                acumulador <= acumulador + unsigned(valor_moeda);
            end if;

            if estado_atual = "000" then    -- Trava o valor após a seleção de produtos
                preco_prod <= unsigned(valor_produto);
            end if;
            
        end if;

    end process;

    -- Lógica Combinacional para Saldo e Troco
    process(acumulador, preco_prod, estado_atual)
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