library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_controller_tb is
end entity;

architecture sim of dram_controller_tb is

    -- Sinais para conectar no componente
    signal clk          : std_logic := '0';
    signal rst          : std_logic := '0';
    signal address      : std_logic_vector(25 downto 0) := (others => '0');
    signal data_in      : std_logic_vector(7 downto 0) := (others => '0');
    signal data_out     : std_logic_vector(7 downto 0);
    signal req          : std_logic := '0';
    signal wEn          : std_logic := '0';
    signal ready        : std_logic;

    -- Interface SDRAM
    signal dram_addr    : std_logic_vector(12 downto 0);
    signal dram_ba      : std_logic_vector(1 downto 0);
    signal dram_cas_n   : std_logic;
    signal dram_cke     : std_logic;
    signal dram_cs_n    : std_logic;
    signal dram_dqm     : std_logic;
    signal dram_dq      : std_logic_vector(7 downto 0);
    signal dram_ras_n   : std_logic;
    signal dram_we_n    : std_logic;

    -- Período do Clock (143 MHz -> aprox 7ns)
    constant CLK_PERIOD : time := 7 ns;

begin

    -- Instância do Controlador
    u_dut : entity work.dram_controller
        port map (
            clk         => clk,
            rst         => rst,
            address     => address,
            data_in     => data_in,
            data_out    => data_out,
            req         => req,
            wEn         => wEn,
            ready       => ready,
            dram_addr   => dram_addr,
            dram_ba     => dram_ba,
            dram_cas_n  => dram_cas_n,
            dram_cke    => dram_cke,
            dram_cs_n   => dram_cs_n,
            dram_dqm    => dram_dqm,
            dram_dq     => dram_dq,
            dram_ras_n  => dram_ras_n,
            dram_we_n   => dram_we_n
        );

    -- Geração do Clock
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Processo de Teste
    stim_proc: process
    begin
        -- Inicia Reset (Lembre que seu código usa if rst = '0')
        rst <= '0';
        wait for 20 ns;
        rst <= '1';

        -- Agora o controlador deve entrar em S_INIT_WAIT.
        -- Como T_200US é muito grande, na simulação você verá o NOP por muito tempo.
        -- Dica: Para simular rápido, você pode alterar temporariamente T_200US para 100 no RTL.

        -- Espera até que o sinal READY suba, indicando fim da inicialização
        wait until ready = '1';
        
        report "Inicializacao concluida com sucesso!";
        
        -- Espaço para testar um REFRESH ou escrita futura
        wait for 100 ns;

        -- Finaliza simulação
        assert false report "Fim do teste de INIT" severity note;
        wait;
    end process;

end architecture;