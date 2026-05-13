library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_dram_controller is
end tb_dram_controller;

architecture sim of tb_dram_controller is

    -- Sinais do Controlador
    signal clk        : std_logic := '0';
    signal rst        : std_logic := '0';
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
    signal dram_dqm   : std_logic;
    signal dram_dq    : std_logic_vector(7 downto 0);
    signal dram_ras_n : std_logic;
    signal dram_we_n  : std_logic;

    -- Sinais Internos da SDRAM Falsa
    signal cas_pipe   : std_logic_vector(3 downto 1) := "000";
    signal fake_mem   : std_logic_vector(7 downto 0) := x"A5"; -- Dado guardado na "memória"

begin

    -- Geração do Clock (143 MHz = ~7 ns período)
    clk <= not clk after 3.5 ns;

    -- Instanciação do seu controlador
    UUT: entity work.dram_controller
        port map (
            clk => clk, rst => rst, address => address,
            data_in => data_in, data_out => data_out,
            req => req, wEn => wEn, ready => ready,
            dram_addr => dram_addr, dram_ba => dram_ba,
            dram_cas_n => dram_cas_n, dram_cke => dram_cke,
            dram_cs_n => dram_cs_n, dram_dqm => dram_dqm,
            dram_dq => dram_dq, dram_ras_n => dram_ras_n, dram_we_n => dram_we_n
        );

    -- ====================================================================
    -- SDRAM FALSA (Simula a latência de 3 ciclos e o tAC de 5.4ns)
    -- ====================================================================
    process(clk)
    begin
        if rising_edge(clk) then
            -- Desloca o pipeline da latência CAS
            cas_pipe(3) <= cas_pipe(2);
            cas_pipe(2) <= cas_pipe(1);
            cas_pipe(1) <= '0';

            -- Detecta comando de READ (CS=0, RAS=1, CAS=0, WE=1)
            if dram_cs_n = '0' and dram_ras_n = '1' and dram_cas_n = '0' and dram_we_n = '1' then
                cas_pipe(1) <= '1';
            end if;

            -- Detecta comando de WRITE
            if dram_cs_n = '0' and dram_ras_n = '1' and dram_cas_n = '0' and dram_we_n = '0' then
                fake_mem <= dram_dq; -- SDRAM "salva" o dado
            end if;
        end if;
    end process;

    -- O dado só aparece fisicamente no fio APÓS 5.4 ns (tAC) do 3º ciclo do clock
    dram_dq <= fake_mem after 5.4 ns when cas_pipe(3) = '1' else (others => 'Z') after 5.4 ns;


    -- ====================================================================
    -- ESTÍMULOS DO USUÁRIO
    -- ====================================================================
    process
    begin
        -- 1. Reset
        rst <= '0';
        wait for 20 ns;
        rst <= '1';

        -- 2. Aguarda o longo ciclo de inicialização
        wait until ready = '1';
        wait for 20 ns;
        
        -- 3. Inicia um READ em um endereço
        address <= "00" & x"000001";
        wEn <= '0';
        req <= '1';
        wait for 20 ns; 
        req <= '0';
        
        -- Aguarda conclusão do READ
        wait until ready = '1';
        wait for 50 ns;

        -- 4. Inicia um WRITE no mesmo endereço
        data_in <= x"42";
        wEn <= '1';
        req <= '1';
        wait for 20 ns;
        req <= '0';
        wEn <= '0';

        -- Aguarda conclusão do WRITE
        wait until ready = '1';
        wait for 50 ns;

        -- Encerra Simulação
        assert false report "Simulação Finalizada" severity failure;
    end process;

end sim;
