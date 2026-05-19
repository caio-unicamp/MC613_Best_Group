library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_system_integration is
end tb_system_integration;

architecture sim of tb_system_integration is

    -- Sinais de Estímulo do "Usuário"
    signal clk   : std_logic := '0';
    signal rst_n : std_logic := '0';
    signal KEY   : std_logic_vector(3 downto 0) := "1111";
    signal SW    : std_logic_vector(9 downto 0) := (others => '0');
    
    -- Displays e Sinais Internos
    signal HEX0, HEX1, HEX4, HEX5 : std_logic_vector(6 downto 0);
    signal req_sig, wEn_sig, ready_sig : std_logic;
    signal addr_sig : std_logic_vector(25 downto 0);
    signal data_bus : std_logic_vector(7 downto 0);
    signal ctrl_data_out : std_logic_vector(7 downto 0);

    -- Pinos Físicos da SDRAM Falsa
    signal dram_addr  : std_logic_vector(12 downto 0);
    signal dram_ba    : std_logic_vector(1 downto 0);
    signal dram_cas_n, dram_cke, dram_cs_n, dram_dqm, dram_ras_n, dram_we_n : std_logic;
    signal dram_dq    : std_logic_vector(7 downto 0);

    -- Sinais da SDRAM Virtual
    type ram_array is array (0 to 1023) of std_logic_vector(7 downto 0);
    signal fake_ram : ram_array := (others => x"FF"); -- Memória inicia cheia de Lixo (FF)
    signal cas_pipe : std_logic_vector(3 downto 1) := "000";
    signal read_buffer : std_logic_vector(7 downto 0) := x"FF";
    signal last_col : integer := 0;

begin

    -- Clock de 143 MHz (Período ~ 7ns)
    clk <= not clk after 3.5 ns;

    -- Lógica de Barramento Bidirecional (Igual ao Top Level)
    data_bus <= ctrl_data_out when wEn_sig = '0' else (others => 'Z');

    -- ==========================================
    -- INSTÂNCIAS DOS SEUS MÓDULOS
    -- ==========================================
    UUT_IFACE: entity work.dram_iface
        port map (
            clk => clk, rst => rst_n, SW => SW, KEY => KEY, ready => ready_sig,
            HEX0 => HEX0, HEX1 => HEX1, HEX4 => HEX4, HEX5 => HEX5,
            address => addr_sig, data => data_bus, req => req_sig, wEn => wEn_sig
        );

    UUT_CONTROLLER: entity work.dram_controller
        port map (
            clk => clk, rst => rst_n, address => addr_sig,
            data_in => data_bus, data_out => ctrl_data_out,
            req => req_sig, wEn => wEn_sig, ready => ready_sig,
            dram_addr => dram_addr, dram_ba => dram_ba, dram_cas_n => dram_cas_n,
            dram_cke => dram_cke, dram_cs_n => dram_cs_n, dram_dqm => dram_dqm,
            dram_dq => dram_dq, dram_ras_n => dram_ras_n, dram_we_n => dram_we_n
        );

    -- ==========================================
    -- SDRAM VIRTUAL INTELIGENTE
    -- ==========================================
    process(clk)
    begin
        if rising_edge(clk) then
            -- Pipeline de Latência CAS = 3
            cas_pipe(3) <= cas_pipe(2);
            cas_pipe(2) <= cas_pipe(1);
            cas_pipe(1) <= '0';

            -- READ
            if dram_cs_n='0' and dram_ras_n='1' and dram_cas_n='0' and dram_we_n='1' then
                cas_pipe(1) <= '1';
                last_col <= to_integer(unsigned(dram_addr(9 downto 0)));
                read_buffer <= fake_ram(to_integer(unsigned(dram_addr(9 downto 0))));
            end if;

            -- WRITE
            if dram_cs_n='0' and dram_ras_n='1' and dram_cas_n='0' and dram_we_n='0' then
                fake_ram(to_integer(unsigned(dram_addr(9 downto 0)))) <= dram_dq;
            end if;
        end if;
    end process;

    -- Delay de Acesso Físico (tAC de ~5.4 ns)
    dram_dq <= read_buffer after 5.4 ns when cas_pipe(3) = '1' else (others => 'Z') after 5.4 ns;

    -- ==========================================
    -- SIMULAÇÃO DO USUÁRIO NA PLACA
    -- ==========================================
    process
    begin
        -- 1. Liga a Placa (Reset)
        rst_n <= '0';
        wait for 50 ns;
        rst_n <= '1';

        -- Aguarda INIT gigante acabar (Dura +200us, mas o modelSim corta rápido no zoom)
        wait until ready_sig = '1';
        wait for 100 ns;

        -- 2. Levanta SW(4) - Muda o Endereço para 1
        -- O Iface deve disparar req = 1 e a memória deve ler FF (pois está vazia)
        report ">>> MUDANDO SW PARA ENDERECO 1 <<<";
        SW(4) <= '1';
        wait until ready_sig = '0'; -- Espera controlador aceitar
        wait until ready_sig = '1'; -- Espera controlador terminar a leitura
        wait for 200 ns;

        -- 3. Prepara dado no SW[3:0] = x"5" e Aperta o KEY[3] (Escrever 5)
        report ">>> ESCREVENDO DADO 5 NO ENDERECO 1 <<<";
        SW(3 downto 0) <= x"5";
        KEY(3) <= '0';
        wait for 50 ns;
        KEY(3) <= '1';
        
        -- IFACE fará WRITE e depois um READ automático para confirmar
        wait until ready_sig = '0';
        wait until ready_sig = '1'; -- Fim do Write
        wait until ready_sig = '0';
        wait until ready_sig = '1'; -- Fim do Read
        wait for 200 ns;

        -- 4. Levanta SW(5) - Muda para Endereço 2
        report ">>> MUDANDO SW PARA ENDERECO 2 <<<";
        SW(4) <= '0';
        SW(5) <= '1';
        wait until ready_sig = '0';
        wait until ready_sig = '1';
        wait for 200 ns;

        -- 5. Volta para SW(4) - Endereço 1 (O Dado '5' tem que ser lido!)
        report ">>> VOLTANDO PARA ENDERECO 1 <<<";
        SW(5) <= '0';
        SW(4) <= '1';
        wait until ready_sig = '0';
        wait until ready_sig = '1';
        wait for 200 ns;

        report ">>> SIMULACAO CONCLUIDA <<<";
        assert false report "Fim do Testbench" severity failure;
    end process;

end sim;