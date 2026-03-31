library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity vending_machine_tb is
end vending_machine_tb;

architecture Behavioral of vending_machine_tb is
    -- Componente da Vending Machine
    component vending_machine
        Port(
            CLOCK_50 : in STD_LOGIC;
            KEY      : in STD_LOGIC_VECTOR(3 downto 0);
            SW       : in STD_LOGIC_VECTOR(9 downto 0);
            HEX0, HEX1, HEX2, HEX3, HEX5 : out STD_LOGIC_VECTOR(6 downto 0);
            LEDR     : out STD_LOGIC_VECTOR(9 downto 0)
        );
    end component;

    -- Sinais de interface
    signal clk      : STD_LOGIC := '0';
    signal key_in   : STD_LOGIC_VECTOR(3 downto 0) := (others => '1'); -- KEYs são active-low
    signal sw_in    : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal hex0, hex1, hex2, hex3, hex5 : STD_LOGIC_VECTOR(6 downto 0);
    signal ledr_out : STD_LOGIC_VECTOR(9 downto 0);

    -- Constantes de tempo
    constant clk_period : time := 20 ns; -- 50MHz

begin
    -- Instanciação da Vending Machine
    uut: vending_machine
        port map (
            CLOCK_50 => clk,
            KEY      => key_in,
            SW       => sw_in,
            HEX0 => hex0, HEX1 => hex1, HEX2 => hex2, HEX3 => hex3, HEX5 => hex5,
            LEDR     => ledr_out
        );

    -- Processo de Clock
    clk_gen: process
    begin
        clk <= '0'; wait for clk_period/2;
        clk <= '1'; wait for clk_period/2;
    end process;

    -- Processo de Teste
    stim_proc: process
        variable L : line;
        
        -- Procedimento auxiliar para simular o apertar de um botão
        procedure apertar_botao(index : integer) is
        begin
            key_in(index) <= '0'; -- Aperta (Active-low)
            wait for clk_period * 3;
            key_in(index) <= '1'; -- Solta
            wait for clk_period * 5;
        end procedure;

    begin
        write(L, string'("--- Iniciando Simulacao da Vending Machine ---"));
        writeline(output, L);

        -- 1. Selecionar Produto (SW(3:0) = "0010")
        sw_in(3 downto 0) <= "0010";
        wait for 100 ns;
        write(L, string'("Produto selecionado: 0010. Confirmando..."));
        writeline(output, L);
        apertar_botao(0); -- Avançar/Confirmar

        -- 2. Inserir Moeda (Ex: 1 Real = SW(8) = '1')
        -- Ajuste os bits de SW conforme seu decode_moedas
        sw_in(9 downto 4) <= "010000"; -- "010000" conforme seu código de moedas
        wait for 40 ns;
        write(L, string'("Moeda de 1 Real detectada. Processando..."));
        writeline(output, L);
        apertar_botao(0); -- Pulso para validar a moeda e avançar no acumulador

        -- 3. Esperar e verificar saldo
        wait for 100 ns;
        write(L, string'("Estado Atual: "));
        write(L, ledr_out(2 downto 0)); -- Se você mapeou o estado nos LEDs
        writeline(output, L);

        -- 4. Simular Finalização ou Cancelamento
        -- Se o valor inserido for suficiente, apertar avançar deve ir para dispensar
        write(L, string'("Finalizando venda..."));
        writeline(output, L);
        apertar_botao(0);

        -- 5. Aguardar o delay_1s (na simulação você pode ver o sinal done_timer subir)
        -- Nota: Se o timer real for 50M de ciclos, a simulação vai demorar.
        wait for 500 ns; 

        write(L, string'("--- Teste Concluido ---"));
        writeline(output, L);
        
        wait;
    end process;

end Behavioral;