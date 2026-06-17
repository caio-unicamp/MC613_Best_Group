library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_dram_controller_novo is
    -- Testbench não possui portas externas
end entity;

architecture sim of tb_dram_controller_novo is

    -- Declaração do DUT (Device Under Test)
    component dram_controller_novo
        port (
            clk        : in    std_logic;
            rst        : in    std_logic;
            address    : in    std_logic_vector(25 downto 0);
            data_in    : in    std_logic_vector(7 downto 0);  
            data_out   : out   std_logic_vector(7 downto 0);  
            req        : in    std_logic;
            wEn        : in    std_logic;
            ready      : out   std_logic;
            dram_addr  : out   std_logic_vector(12 downto 0);
            dram_ba    : out   std_logic_vector(1 downto 0);
            dram_cas_n : out   std_logic;
            dram_cke   : out   std_logic;
            dram_cs_n  : out   std_logic;
            dram_udqm  : out   std_logic;
            dram_ldqm  : out   std_logic;
            dram_dq    : inout std_logic_vector(15 downto 0);
            dram_ras_n : out   std_logic;    
            dram_we_n  : out   std_logic
        );
    end component;

    -- Sinais de Controle
    signal clk        : std_logic := '0';
    signal rst        : std_logic := '0';
    constant CLK_PERIOD : time := 10 ns; -- 100 MHz
    signal sim_done   : boolean := false;

    -- Sinais de Interface do Usuário
    signal address    : std_logic_vector(25 downto 0) := (others => '0');
    signal data_in    : std_logic_vector(7 downto 0)  := (others => '0');
    signal data_out   : std_logic_vector(7 downto 0);
    signal req        : std_logic := '0';
    signal wEn        : std_logic := '0';
    signal ready      : std_logic;

    -- Sinais Físicos SDRAM
    signal dram_addr  : std_logic_vector(12 downto 0);
    signal dram_ba    : std_logic_vector(1 downto 0);
    signal dram_cas_n : std_logic;
    signal dram_cke   : std_logic;
    signal dram_cs_n  : std_logic;
    signal dram_udqm  : std_logic;
    signal dram_ldqm  : std_logic;
    signal dram_dq    : std_logic_vector(15 downto 0);
    signal dram_ras_n : std_logic;
    signal dram_we_n  : std_logic;

    -- Sinal de injeção (Mock) para o barramento inout dram_dq
    signal mock_dq_drive : std_logic_vector(15 downto 0) := (others => 'Z');

begin

    -- Instanciação do Controlador
    DUT: dram_controller_novo
        port map (
            clk        => clk,
            rst        => rst,
            address    => address,
            data_in    => data_in,
            data_out   => data_out,
            req        => req,
            wEn        => wEn,
            ready      => ready,
            dram_addr  => dram_addr,
            dram_ba    => dram_ba,
            dram_cas_n => dram_cas_n,
            dram_cke   => dram_cke,
            dram_cs_n  => dram_cs_n,
            dram_udqm  => dram_udqm,
            dram_ldqm  => dram_ldqm,
            dram_dq    => dram_dq,
            dram_ras_n => dram_ras_n,
            dram_we_n  => dram_we_n
        );

    -- Atribuição concorrente para simular a resposta da SDRAM no barramento bidirecional
    dram_dq <= mock_dq_drive;

    -- Geração do Clock
    clk_process : process
    begin
        while not sim_done loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Processo de Estímulos e Verificação (Prints)
    stimulus_process : process
    begin
        report "=================================================";
        report " INICIANDO SIMULACAO DO CONTROLADOR SDRAM";
        report "=================================================";

        -- 1. Aplicando Reset
        rst <= '0';
        wait for 5 * CLK_PERIOD;
        rst <= '1';
        report "[LOG] Reset liberado. Aguardando a inicializacao de 200us...";

        -- 2. Aguardando inicialização terminar
        -- Observação: Devido ao T_200US = 28600 no seu código, isso levará ~286us no simulador.
        wait until ready = '1';
        report "[LOG] Inicializacao concluida! Controlador no estado S_IDLE.";

        -- Um pequeno delay de respiro
        wait for 10 * CLK_PERIOD;

        ---------------------------------------------------------
        -- 3. TESTE DE ESCRITA
        ---------------------------------------------------------
        report "-------------------------------------------------";
        report "[TESTE 1] Iniciando operacao de ESCRITA...";
        
        wait until rising_edge(clk);
        address <= std_logic_vector(to_unsigned(1024, 26)); -- Endereço arbitrário
        data_in <= x"AA"; -- Dado a ser gravado (10101010)
        wEn     <= '1';   -- Modo: Escrita
        req     <= '1';   -- Dispara a requisição
        
        wait until rising_edge(clk);
        req     <= '0';   -- Baixa o trigger
        wEn     <= '0';
        
        -- Aguarda o controlador processar a FSM inteira e voltar para IDLE (ready = '1')
        wait until ready = '1';
        report "[TESTE 1] Escrita finalizada com sucesso.";

        wait for 20 * CLK_PERIOD;

        ---------------------------------------------------------
        -- 4. TESTE DE LEITURA (Mocking Data)
        ---------------------------------------------------------
        report "-------------------------------------------------";
        report "[TESTE 2] Iniciando operacao de LEITURA...";
        
        wait until rising_edge(clk);
        address <= std_logic_vector(to_unsigned(1024, 26)); 
        wEn     <= '0';   -- Modo: Leitura
        req     <= '1';   -- Dispara a requisição
        
        wait until rising_edge(clk);
        req     <= '0';

        -- A FSM vai passar por ACTIVATE, WAIT, READ_CMD, etc.
        -- O controlador espera que a memória devolva os dados no dram_dq
        -- Como `address(0) = '0'` no nosso teste (1024 é par), o controlador 
        -- lerá os bits mais baixos: `dram_dq(7 downto 0)`.
        
        -- Vamos forçar o dado no barramento `dram_dq` usando nosso sinal mock.
        -- O dado forçado será x"00AA" para que os 8 bits baixos contenham x"AA".
        mock_dq_drive <= x"00AA";
        
        wait until ready = '1';
        
        -- Libera o barramento de volta para alta impedância (Z)
        mock_dq_drive <= (others => 'Z');

        -- Validação final do dado lido com Assert
        if data_out = x"AA" then
            report "[SUCESSO] Dado lido confere com o esperado (xAA)!" severity note;
        else
            report "[FALHA] O dado lido no data_out está incorreto!" severity error;
        end if;

		  ---------------------------------------------------------
        -- 5. TESTE DE AUTO-REFRESH
        ---------------------------------------------------------
        report "-------------------------------------------------";
        report "[TESTE 3] Aguardando timer de AUTO-REFRESH...";
        report "[LOG] O contador eh de 1100 ciclos. Aguardando disparo...";
        
        -- Garantimos que nenhuma nova requisição será feita
        req <= '0'; 
        wEn <= '0';

        -- Aguarda o controlador sair do estado IDLE por conta própria
        wait until ready = '0';
        report "[LOG] Controlador abaixou o sinal 'ready' autonomamente. Iniciando Refresh...";

        -- Observando os comandos nos pinos pode ser visualizado na Waveform, 
        -- mas via código esperamos ele voltar pro IDLE:
        wait until ready = '1';
        report "[TESTE 3] Auto-Refresh concluido! Controlador de volta ao estado S_IDLE pronto para uso.";
		  
        report "=================================================";
        report " SIMULACAO FINALIZADA";
        report "=================================================";
        sim_done <= true; -- Encerra o loop do clock
        wait;
    end process;

end architecture;