library ieee;
use ieee.std_logic_1164.all;

entity dram_iface_tb is
end dram_iface_tb;

architecture sim of dram_iface_tb is
    -- Sinais para conectar na UUT (Unit Under Test)
    signal clk       : std_logic := '0';
    signal KEY       : std_logic_vector(3 downto 0) := "1111";
    signal SW        : std_logic_vector(9 downto 4) := "000000";
    signal ready     : std_logic := '0';
    signal write_req : std_logic;
    signal read_req  : std_logic;

    -- Constante de tempo para 50MHz
    constant clk_period : time := 20 ns;

begin

    -- Instanciação do componente
    uut: entity work.dram_iface
        port map (
            clk       => clk,
            KEY       => KEY,
            SW        => SW,
            ready     => ready,
            write_req => write_req,
            read_req  => read_req
        );

    -- Gerador de clock
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Processo de Estímulos
    stim_proc: process
    begin		
        -- --- CENÁRIO 1: Reset Inicial ---
        report "Iniciando Reset...";
        KEY(0) <= '0'; -- Ativa Reset
        wait for 50 ns;
        KEY(0) <= '1'; -- Libera Reset
        wait for 20 ns;
        
        -- Espera a DRAM dizer que está pronta para a IFACE sair de ST_RESET
        ready <= '1';
        wait for clk_period * 2;

        -- --- CENÁRIO 2: Escrita Manual (KEY3) ---
        report "Testando Escrita via KEY3...";
        KEY(3) <= '0'; -- Simula pressão do botão
        wait for clk_period; 
        KEY(3) <= '1'; -- Solta o botão
        
        -- A FSM deve estar em ST_REQ_WRITE (write_req = '1')
        -- No próximo ciclo, ela vai para ST_WAIT_WRITE. Vamos simular a DRAM ocupada:
        ready <= '0'; 
        wait for clk_period * 3;
        
        -- DRAM termina a escrita
        ready <= '1';
        -- Agora a FSM deve ir para ST_REQ_READ (conforme seu código)
        wait for clk_period * 5;

        -- --- CENÁRIO 3: Leitura por Mudança de Chave (SW) ---
        report "Testando Leitura via Mudança de SW...";
        SW <= "101010"; -- Muda as chaves
        wait for clk_period;
        
        -- FSM deve ir para ST_REQ_READ e depois ST_WAIT_READ
        -- Vamos simular a latência da DRAM
        ready <= '0';
        wait for clk_period * 4;
        ready <= '1'; -- Leitura concluída
        
        wait for clk_period * 5;
        
        report "Simulação concluída com sucesso!";
        wait;
    end process;

end sim;