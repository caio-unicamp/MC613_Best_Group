library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all; -- Biblioteca necessária para saída limpa

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

    stim_proc: process
        variable v_line : line; -- Variável para manipulação de texto
    begin        
        write(v_line, string'("==================================================="));
        writeline(output, v_line);
        write(v_line, string'("INICIANDO SIMULACAO DA MAQUINA DE VENDAS"));
        writeline(output, v_line);
        write(v_line, string'("==================================================="));
        writeline(output, v_line);
        
          
        clr_acumula <= '1';
        wait for clk_period*2;
        clr_acumula <= '0';
        wait for clk_period;

        write(v_line, string'("--- TESTE 1: Compra Exata (Produto 0 = R$ 1,25) ---"));
        writeline(output, v_line);
        
          -- Estado 000: Escolha de produto 
        estado_atual <= "000";
        valor_produto <= std_logic_vector(to_unsigned(125, 11));
        wait for clk_period*2; -- Dá tempo para o registrador salvar o preço
        write(v_line, string'("Produto Selecionado! Preco: ") & integer'image(to_integer(unsigned(valor_produto))) & string'(" centavos."));
        writeline(output, v_line);
        
        estado_atual <= "001";
        valor_produto <= std_logic_vector(to_unsigned(500, 11)); 
        wait for clk_period;

        valor_moeda <= std_logic_vector(to_unsigned(100, 11));
         enable_acumula <= '1'; -- Pulso do botão Avançar
        wait for clk_period;   -- O pulso dura 1 clock
        enable_acumula <= '0';
        
        wait for clk_period*2; -- Aguarda o usuário pegar outra moeda
        write(v_line, string'("[!] Inseriu moeda de 100 centavos."));
        writeline(output, v_line);
        write(v_line, string'(" -> Valor Acumulado atual: ") & integer'image(to_integer(unsigned(valor_acumulado))));
        writeline(output, v_line);
        write(v_line, string'(" -> Saldo Restante a pagar: ") & integer'image(to_integer(unsigned(saldo_restante))));
        writeline(output, v_line);
        
        valor_moeda <= std_logic_vector(to_unsigned(25, 11));
        enable_acumula <= '1';
        wait for clk_period;
        enable_acumula <= '0';

        wait for clk_period*2;
        write(v_line, string'("[!] Inseriu moeda de 25 centavos."));
        writeline(output, v_line);
        write(v_line, string'(" -> Valor Acumulado atual: ") & integer'image(to_integer(unsigned(valor_acumulado))));
        writeline(output, v_line);

        if venda_concluida = '1' then
            write(v_line, string'("[SUCESSO] Venda Concluida! Troco gerado: ") & integer'image(to_integer(unsigned(valor_troco))));
            writeline(output, v_line);
        else
            write(v_line, string'("[ERRO] Venda nao foi concluida."));
            writeline(output, v_line);
        end if;
        
        clr_acumula <= '1';
        wait for clk_period;
        clr_acumula <= '0';
        wait for clk_period;

        write(v_line, string'("--- TESTE 2: Compra com Troco (Produto 1 = R$ 3,00) ---"));
        writeline(output, v_line);
        
        estado_atual <= "000";
        valor_produto <= std_logic_vector(to_unsigned(300, 11));
        wait for clk_period*2;
        write(v_line, string'("Produto Selecionado! Preco travado internamente em: 300 centavos."));
        writeline(output, v_line);
        
        estado_atual <= "001";
        wait for clk_period;

        valor_moeda <= std_logic_vector(to_unsigned(200,11));
        enable_acumula <= '1';
        wait for clk_period;
        enable_acumula <= '0';
        wait for clk_period*2;
        write(v_line, string'("[!] Inseriu moeda de 200 centavos."));
        writeline(output, v_line);
        write(v_line, string'(" -> Saldo Restante a pagar: ") & integer'image(to_integer(unsigned(saldo_restante))));
        writeline(output, v_line);

        valor_moeda <= std_logic_vector(to_unsigned(200, 11));
        enable_acumula <= '1';
        wait for clk_period;
        enable_acumula <= '0';

        wait for clk_period*2;
        write(v_line, string'("[!] Inseriu moeda de 200 centavos."));
        writeline(output, v_line);
        write(v_line, string'(" -> Valor Acumulado Total: ") & integer'image(to_integer(unsigned(valor_acumulado))));
        writeline(output, v_line);
        
        if venda_concluida = '1' then
            write(v_line, string'("[SUCESSO] Venda Concluida! Troco a devolver: ") & integer'image(to_integer(unsigned(valor_troco))));
            writeline(output, v_line);
        end if;

        write(v_line, string'("--- TESTE 3: Bloqueio de moeda em estado invalido ---"));
        writeline(output, v_line);
        
        estado_atual <= "010";
        wait for clk_period;
        write(v_line, string'("Mudou para estado diferente de 'Inserir Dinheiro' (010)."));
        writeline(output, v_line);
        
        valor_moeda <= std_logic_vector(to_unsigned(50, 11));
        enable_acumula <= '1';
        wait for clk_period;
        enable_acumula <= '0';
        
        wait for clk_period*2;
        write(v_line, string'("[!] Tentou inserir 50 centavos."));
        writeline(output, v_line);
        write(v_line, string'(" -> Valor Acumulado atual (deve continuar o mesmo): ") & integer'image(to_integer(unsigned(valor_acumulado))));
        writeline(output, v_line);

        write(v_line, string'("==================================================="));
        writeline(output, v_line);
        write(v_line, string'("FIM DA SIMULACAO"));
        writeline(output, v_line);
        write(v_line, string'("==================================================="));
        writeline(output, v_line);

        wait;
    end process;

end behavior;