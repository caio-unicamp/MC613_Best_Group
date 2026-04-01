library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all; -- Necessário para as funções de print (write/writeline)

entity vending_machine_tb is
end vending_machine_tb;

architecture sim of vending_machine_tb is

    -- Sinais para conectar ao Top-Level
    signal clk_50   : std_logic := '0';
    signal key      : std_logic_vector(3 downto 0) := (others => '1'); 
    signal sw       : std_logic_vector(9 downto 0) := (others => '0');
    signal hex0, hex1, hex2, hex3, hex5 : std_logic_vector(6 downto 0);
    signal ledr     : std_logic_vector(9 downto 0);

    constant CLK_PERIOD : time := 20 ns;

    -- Função auxiliar para converter std_logic_vector em string (para os prints)
    function to_string(sv: std_logic_vector) return string is
        variable res_str: string(1 to sv'length);
    begin
        for i in sv'range loop
            if sv(i) = '1' then res_str(sv'length - i) := '1';
            else res_str(sv'length - i) := '0';
            end if;
        end loop;
        return res_str;
    end function;

    -- Procedimento para print customizado
    procedure print_log(msg : string) is
        variable l : line;
    begin
        write(l, msg);
        writeline(output, l);
    end procedure;

    -- Print do status atual do hardware (Comprovação das saídas)
    procedure print_status is
        variable l : line;
    begin
        write(l, string'("[STATUS] SW: ") & to_string(sw));
        write(l, string'(" | LEDR: ") & to_string(ledr));
		write(l, string'(" | HEX5 (Codigo): ") & to_string(hex5));
		writeline(output, l);
        write(l, string'("HEX0: ") & to_string(hex0));
		writeline(output, l);
		write(l, string'("HEX1: ") & to_string(hex1));
		writeline(output, l);
		write(l, string'("HEX2: ") & to_string(hex2));
		writeline(output, l);
		write(l, string'("HEX3: ") & to_string(hex3));
		writeline(output, l);
		 
        
    end procedure;

    procedure press_key(signal k_sig : out std_logic_vector; index : integer) is
    begin
        k_sig(index) <= '0';
        wait for 100 ns;
        k_sig(index) <= '1';
        wait for 100 ns;
    end procedure;

begin

    uut: entity work.vending_machine
        port map (
            CLOCK_50 => clk_50,
            KEY      => key,
            SW       => sw,
            HEX0     => hex0, HEX1 => hex1, HEX2 => hex2, HEX3 => hex3,
            HEX5     => hex5,
            LEDR     => ledr
        );

    clk_process : process
    begin
        clk_50 <= '0'; wait for CLK_PERIOD/2;
        clk_50 <= '1'; wait for CLK_PERIOD/2;
    end process;

    stim_proc: process
    begin
        print_log("--- INICIANDO SIMULACAO DA MAQUINA DE VENDAS ---");
        wait for 100 ns;
        
        ------------------------------------------------------------------------
        print_log("TESTE 1: Verificando selecao de produtos via SW(3:0)");
        ------------------------------------------------------------------------
        for i in 0 to 15 loop -- Testando os produtos
            sw(3 downto 0) <= std_logic_vector(to_unsigned(i, 4));
            wait for 100 ns;
            print_log("Produto " & integer'image(i) & " selecionado.");
            print_status;
        end loop;

        ------------------------------------------------------------------------
        print_log("TESTE 2: Insercao de moedas e Cancelamento");
        ------------------------------------------------------------------------
        -- Inserir R$ 0,50 (SW3)
		press_key(key, 0); 
        sw(9 downto 4) <= "001000"; 
        print_log("Selecionando R$ 0,50 no SW(7)");
        press_key(key, 0); 
        print_log("KEY(0) pressionada para inserir saldo.");
        wait for 100 ns;
        sw(9 downto 4) <= "000000";
        print_status;

        -- Cancelar
        print_log("Pressionando KEY(1) para CANCELAR...");
        press_key(key, 1);
        
        loop
            wait until rising_edge(clk_50);
            if ledr(1) = '1' then
                print_status;
                exit;
            end if;
        end loop;
        wait for 1.2 us; 

        ------------------------------------------------------------------------
        print_log("TESTE 3: Venda com Troco (Produto 0 = 125, Inserindo 200)");
        ------------------------------------------------------------------------
        sw(3 downto 0) <= "0000"; 
        press_key(key, 0); -- Seleciona
        print_log("Produto 0 selecionado.");

        sw(9 downto 4) <= "100000"; -- R$ 2,00
        print_log("Inserindo nota de R$ 2,00 (SW9)");
        press_key(key, 0); 
        wait for 100 ns;
 
        -- Aguarda Produto
        loop
            wait until rising_edge(clk_50);
            if ledr(0) = '1' then
                print_status;
                exit;
            end if;
        end loop;          
          
        -- Aguarda Troco
        loop
            wait until rising_edge(clk_50);
            if ledr(1) = '1' then
                print_status;
                exit;
            end if;
        end loop;          
        
        wait for 2.5 us; 

        ------------------------------------------------------------------------
        print_log("TESTE 4: Valor Exato (Produto 1 = 300, Inserindo 3x 100)");
        ------------------------------------------------------------------------
        sw(3 downto 0) <= "0001";
        press_key(key, 0);
        print_log("Produto 1 selecionado (Custo 3,00)");
        
        for i in 1 to 3 loop
            sw(9 downto 4) <= "010000"; -- R$ 1,00
            print_log("Inserindo R$ 1,00 pela " & integer'image(i) & "a vez.");
            press_key(key, 0);
            sw(9 downto 4) <= "000000";
            wait for 100 ns;
            print_status;
        end loop;
        
        print_log("Confirmando finalizacao da venda...");
        press_key(key, 0); 
          
        loop
            wait until rising_edge(clk_50);
            if ledr(0) = '1' then
                print_status;
                exit;
            end if;
        end loop;          
        
		  wait for 2.5 us; 
		  
			------------------------------------------------------------------------
        print_log("TESTE 5: Tentativa de inserir DUAS notas ao mesmo tempo");
        ------------------------------------------------------------------------
        sw(3 downto 0) <= "0000"; -- Seleciona produto 0
        press_key(key, 0);
		print_status;
        
        sw(9 downto 4) <= "110000"; -- Tenta R$ 2,00 + R$ 1,00 simultaneamente
        print_log("Setando SW(9) e SW(8) em '1' (Invalido)");
        press_key(key, 0);
        
        wait for 100 ns;
        print_log("O saldo no HEX nao deve ter alterado.");
        print_status;
        sw(9 downto 4) <= "000000";

        ------------------------------------------------------------------------
        print_log("TESTE 6: Prosseguir o estado inserir dinheiro sem nenhuma nota selecionada");
        ------------------------------------------------------------------------
        sw(3 downto 0) <= "0000"; press_key(key, 0); -- Seleciona produto
        sw(9 downto 4) <= "000000"; -- Nenhuma nota
        print_log("Pressionando AVANCAR sem notas levantadas...");
        press_key(key, 0);
        wait for 100 ns;
        print_log("O saldo restante nao deve ter diminuido.");
        print_status;

        ------------------------------------------------------------------------
        print_log("TESTE 7: Tentativa de cancelamento durante a liberacao");
        ------------------------------------------------------------------------
        sw(3 downto 0) <= "0000"; -- Seleciona Produto 0 = 1,25
        press_key(key, 0);
        
        sw(9 downto 4) <= "100000"; -- Insere R$ 2,00
        print_log("Inserindo R$ 2,00 para testar a liberacao...");
        press_key(key, 0);
        sw(9 downto 4) <= "000000";
        
        -- Aguarda o estado de "Dispensar" (LEDR0 aceso)
        loop
            wait until rising_edge(clk_50);
            if ledr(0) = '1' then
                print_log("Produto esta sendo liberado! Pressionando CANCELAR no meio do processo...");
                
                -- Pressiona o botão de cancelar ENQUANTO o timer de 1s está rodando
                key(1) <= '0';
                wait for 100 ns;
                key(1) <= '1';
                
                print_status;
                exit;
            end if;
        end loop;
        
        print_log("A maquina deve ignorar o cancelamento e prosseguir para o troco.");
        wait for 2.5 us; -- Aguarda o tempo normal de finalizacao (dispensa + troco)

        ------------------------------------------------------------------------
        print_log("TESTE 8: Overflow de dinheiro (> 2047 centavos)");
        ------------------------------------------------------------------------
        sw(3 downto 0) <= "1111"; -- Produto F = 8,00)
        press_key(key, 0);
        
        print_log("Inserindo 12 notas de R$ 2,00 (Total 2400 > limite de 2047)...");
        for i in 1 to 12 loop
            sw(9 downto 4) <= "100000";
            press_key(key, 0);
            sw(9 downto 4) <= "000000";
            wait for 50 ns;
        end loop;
        
        print_log("Verificando o comportamento do acumulador apos o Overflow:");
        print_status;
        
        -- Cancela para limpar o "lixo" gerado pelo overflow e restaurar a maquina
        print_log("Cancelando para limpar a maquina...");
        press_key(key, 1);
        wait for 1.2 us;

        ------------------------------------------------------------------------
        print_log("TESTE 9: Inserir dinheiro antes da selecao do produto");
        ------------------------------------------------------------------------
        sw(3 downto 0) <= "0010"; -- Produto 2
        sw(9 downto 4) <= "100000"; -- Chave de R$ 2,00 levantada acidentalmente cedo demais
        
        print_log("Chave de R$ 2,00 levantada antes de confirmar o produto.");
        print_log("Pressionando Confirmar/Avancar...");
        press_key(key, 0);
        
        wait for 100 ns;
        print_log("O dinheiro nao deve ter sido somado. Apenas o Produto 2 deve ter sido selecionado.");
        print_status;
        
        sw(9 downto 4) <= "000000"; -- Abaixa a chave de dinheiro
        
        -- Cancela a operacao para deixar a maquina zerada para o fim do testbench
        press_key(key, 1);
        wait for 1.2 us;

        -- Finaliza a simulação
        report "===================================================";
        report "FIM DA SIMULACAO";
        report "===================================================";
        wait;
    end process;

end sim;