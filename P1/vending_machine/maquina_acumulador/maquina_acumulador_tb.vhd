library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity maquina_acumulador_tb is
end maquina_acumulador_tb;

architecture behavior of maquina_acumulador_tb is 

    component maquina_acumulador
    Port (
        clk             : in  STD_LOGIC;
        clr_acumula     : in  STD_LOGIC;
        estado_atual    : in  STD_LOGIC_VECTOR(2 downto 0);
        enable_acumula  : in  STD_LOGIC;
        valor_produto   : in  STD_LOGIC_VECTOR(10 downto 0);
        valor_moeda     : in  STD_LOGIC_VECTOR(10 downto 0);
        saldo_restante  : out STD_LOGIC_VECTOR(10 downto 0);
        valor_troco     : out STD_LOGIC_VECTOR(10 downto 0);
        valor_acumulado : out STD_LOGIC_VECTOR(10 downto 0);
        venda_concluida : out STD_LOGIC
    );
    end component;

    -- Sinais de entrada
    signal clk             : std_logic := '0';
    signal clr_acumula     : std_logic := '0';
    signal estado_atual    : std_logic_vector(2 downto 0) := "000";
    signal enable_acumula  : std_logic := '0';
    signal valor_produto   : std_logic_vector(10 downto 0) := (others => '0');
    signal valor_moeda     : std_logic_vector(10 downto 0) := (others => '0');

    -- Sinais de saída
    signal saldo_restante  : std_logic_vector(10 downto 0);
    signal valor_troco     : std_logic_vector(10 downto 0);
    signal valor_acumulado : std_logic_vector(10 downto 0);
    signal venda_concluida : std_logic;

    -- Definição do período do Clock (50 MHz = 20 ns)
    constant clk_period : time := 20 ns;

begin

    -- Instanciação da máquina acumuladora
    uut: maquina_acumulador PORT MAP (
        clk => clk,
        clr_acumula => clr_acumula,
        estado_atual => estado_atual,
        enable_acumula => enable_acumula,
        valor_produto => valor_produto,
        valor_moeda => valor_moeda,
        saldo_restante => saldo_restante,
        valor_troco => valor_troco,
        valor_acumulado => valor_acumulado,
        venda_concluida => venda_concluida
    );

    -- Processo de geração do Clock
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Processo de estímulos
    stim_proc: process
    begin		
        report "===================================================";
        report "INICIANDO SIMULACAO DA MAQUINA DE VENDAS";
        report "===================================================";
        -- Inicialização e Reset Inicial
        clr_acumula <= '1';
        wait for clk_period*2;
        clr_acumula <= '0';
        wait for clk_period;

        -- =========================================================
        report "--- TESTE 1: Compra Exata (Produto = R$ 1,25) ---";
        -- =========================================================
        
        -- Estado 000: Escolha de produto 
        estado_atual <= "000";
        valor_produto <= std_logic_vector(to_unsigned(125, 11));
        wait for clk_period*2; -- Dá tempo para o registrador salvar o preço
        report "Produto Selecionado! Preco: " & integer'image(to_integer(unsigned(valor_produto))) & " centavos.";
        
        -- Estado 001: Inserir dinheiro
        estado_atual <= "001";
        -- Tenta mudar o produto nos switches para testar se o preço travou mesmo. 
        -- O módulo deve ignorar isso.
        valor_produto <= std_logic_vector(to_unsigned(500, 11)); 
        wait for clk_period;

        -- Inserindo moeda de R$ 1,00
        valor_moeda <= std_logic_vector(to_unsigned(100, 11));
        enable_acumula <= '1'; -- Pulso do botão Avançar
        wait for clk_period;   -- O pulso dura 1 clock
        enable_acumula <= '0';
        
        wait for clk_period*3; -- Aguarda o usuário pegar outra moeda
        -- Saldo deve ser 25 centavos, acumulado 100.
        
        -- Inserindo moeda de R$ 0,25 (25 centavos)
        valor_moeda <= std_logic_vector(to_unsigned(25, 11));
        enable_acumula <= '1';
        wait for clk_period;
        enable_acumula <= '0';

        wait for clk_period*3;
        -- Acumulado deve ser 125. venda_concluida = 1. troco = 0.
        
        -- Finaliza venda e limpa a máquina
        clr_acumula <= '1';
        wait for clk_period;
        clr_acumula <= '0';
        wait for clk_period;

        -- =========================================================
        -- TESTE 2: Compra com troco (Produto 1 = R$ 3,00)
        -- =========================================================
        
        -- Estado 000: Escolher produto
        estado_atual <= "000";
        valor_produto <= std_logic_vector(to_unsigned(300, 11));
        wait for clk_period*2;
        
        -- Estado 001: Inserir dinheiro
        estado_atual <= "001";
        wait for clk_period;

        -- Inserindo R$ 2,00
        valor_moeda <= std_logic_vector(to_unsigned(2))
        enable_acumula <= '1';
        wait for clk_period;
        enable_acumula <= '0';
        wait for clk_period*2;

        -- Inserindo mais R$ 2,00 (Passando do valor, total inserido = 400)
        valor_moeda <= std_logic_vector(to_unsigned(200, 11));
        enable_acumula <= '1';
        wait for clk_period;
        enable_acumula <= '0';

        wait for clk_period*3;
        -- Acumulado deve ser 400. venda_concluida = 1. troco = 100. saldo = 0.

        -- =========================================================
        -- TESTE 3: Ignorar moeda se estado não for 001
        -- =========================================================
        
        -- Mudando o estado para "010" (Dispensando, por exemplo)
        estado_atual <= "010";
        wait for clk_period;
        
        -- Mandando pulso de moeda de 50 centavos
        valor_moeda <= std_logic_vector(to_unsigned(50, 11));
        enable_acumula <= '1';
        wait for clk_period;
        enable_acumula <= '0';
        
        wait for clk_period*3;
        -- O acumulado NÃO deve ter mudado (deve continuar em 400), 
        -- porque o estado não era "001".

        -- Finaliza a simulação
        wait;
    end process;

end behavior;