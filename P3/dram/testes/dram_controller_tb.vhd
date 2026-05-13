library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_controller_tb is
end entity;

architecture sim of dram_controller_tb is

    -- Sinais de Estímulo (Interface dram_iface)
    signal clk      : std_logic := '0';
    signal rst      : std_logic := '0';
    signal address  : std_logic_vector(25 downto 0) := (others => '0');
    signal data_in  : std_logic_vector(7 downto 0) := (others => '0');
    signal data_out : std_logic_vector(7 downto 0);
    signal req      : std_logic := '0';
    signal wEn      : std_logic := '0';
    signal ready    : std_logic;

    -- Sinais de Monitoramento (Interface Física SDRAM)
    signal dram_addr  : std_logic_vector(12 downto 0);
    signal dram_ba    : std_logic_vector(1 downto 0);
    signal dram_cas_n : std_logic;
    signal dram_cke   : std_logic;
    signal dram_cs_n  : std_logic;
    signal dram_dqm   : std_logic;
    signal dram_dq    : std_logic_vector(7 downto 0);
    signal dram_ras_n : std_logic;
    signal dram_we_n  : std_logic;

    -- Período do clock: 143 MHz = ~7 ns
    constant CLK_PERIOD : time := 7 ns;

begin

    -- Instanciação do Device Under Test (DUT)
    dut : entity work.dram_controller
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
            dram_dqm   => dram_dqm,
            dram_dq    => dram_dq,
            dram_ras_n => dram_ras_n,
            dram_we_n  => dram_we_n
        );

    -- Geração do Clock
    clk_process : process
    begin
        while now < 1 ms loop -- Limite de segurança para a simulação
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Processo de Estímulos
    stim_proc : process
    begin
        -- 1. Início: Reset do Sistema
        -- Reset ativo em baixo conforme seu código (rst = '0')
        rst <= '0';
        wait for 20 ns;
        rst <= '1';
        
        -- 2. Aguarda a Inicialização (INIT)
        -- O controlador passará por S_INIT_WAIT -> PRECHARGE -> 8x REFRESH -> MRS
        -- Como T_200US é grande, aguardamos o sinal READY
        report "Aguardando fim da inicializacao (Wait 200us + Refresh + MRS)...";
        wait until ready = '1';
        report "Controlador pronto (READY = 1)!";
        wait for 50 ns;

        -- 3. Teste de ESCRITA (WRITE)
        -- Endereço: BA="01", ROW="0000000000001", COL="0000000001"
        -- Concatenando conforme seu código: 
        -- address = BA (25-24) & ROW (23-11) & COL_EXT (10) & COL (9-0)
        report "Iniciando operacao de ESCRITA...";
        address <= "01" & "0000000000001" & "0" & "0000000001";
        data_in <= x"AB"; -- Dado a ser escrito
        wEn     <= '1';
        req     <= '1';
        
        wait until ready = '0';
        req <= '0'; -- Handshake do request
        
        wait until ready = '1';
        report "Escrita concluida!";
        wait for 50 ns;

        -- 4. Teste de LEITURA (READ)
        -- Mesmos endereços usados na escrita
        report "Iniciando operacao de LEITURA...";
        address <= "01" & "0000000000001" & "0" & "0000000001";
        wEn     <= '0';
        req     <= '1';

        -- Simulação do comportamento da SDRAM: 
        -- A SDRAM coloca o dado no barramento após o comando READ + CAS Latency
        -- No seu código, você espera T_CAS-1 e lê data_out <= dram_dq
        -- Vamos forçar o sinal no barramento dram_dq para simular a resposta da memória
        wait until dram_cas_n = '0'; -- Detecta o comando de leitura
        wait for (3 * CLK_PERIOD);   -- Espera o tempo da latência CAS (3 ciclos)
        dram_dq <= x"AB";            -- Simula a SDRAM entregando o dado
        
        wait for CLK_PERIOD;
        dram_dq <= (others => 'Z'); -- Libera o barramento
        
        wait until ready = '1';
        report "Leitura concluida! Dado recebido: " & to_hstring(data_out);
        
        -- Verificação
        assert data_out = x"AB" 
            report "ERRO: Dado lido incorreto!" 
            severity error;

        -- 5. Teste de Refresh Periódico
        -- Você pode esperar o timer de refresh estourar ou diminuir T_REFI para testar mais rápido
        report "Aguardando refresh periodico...";
        wait for 100 ns;

        report "Fim de todos os testes.";
        wait;
    end process;

end architecture;