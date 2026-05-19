library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level_tb is
end entity;

architecture sim of top_level_tb is

    -- Sinais de Entrada do Top Level
    signal CLOCK_50 : std_logic := '0';
    signal KEY      : std_logic_vector(3 downto 0) := (others => '1'); -- Botões soltos = '1'
    signal SW       : std_logic_vector(9 downto 0) := (others => '0');

    -- Sinais de Saída do Top Level (Displays e LEDs)
    signal HEX0 : std_logic_vector(6 downto 0);
    signal HEX1 : std_logic_vector(6 downto 0);
    signal HEX4 : std_logic_vector(6 downto 0);
    signal HEX5 : std_logic_vector(6 downto 0);
    signal LEDR : std_logic_vector(9 downto 0);

    -- Pinos Físicos da SDRAM
    signal DRAM_CLK   : std_logic;
    signal DRAM_ADDR  : std_logic_vector(12 downto 0);
    signal DRAM_BA    : std_logic_vector(1 downto 0);
    signal DRAM_CAS_N : std_logic;
    signal DRAM_CKE   : std_logic;
    signal DRAM_CS_N  : std_logic;
    signal DRAM_DQM   : std_logic;
    signal DRAM_DQ    : std_logic_vector(7 downto 0) := (others => 'Z'); -- Inicializado em Tristate
    signal DRAM_RAS_N : std_logic;
    signal DRAM_WE_N  : std_logic;

    -- Constantes
    constant CLK_PERIOD : time := 20 ns; -- 50 MHz

begin

    -- =========================================================================
    -- Instância do Device Under Test (DUT)
    -- =========================================================================
    dut : entity work.top_level
        port map (
            CLOCK_50   => CLOCK_50,
            KEY        => KEY,
            SW         => SW,
            HEX0       => HEX0,
            HEX1       => HEX1,
            HEX4       => HEX4,
            HEX5       => HEX5,
            LEDR       => LEDR,
            DRAM_CLK   => DRAM_CLK,
            DRAM_ADDR  => DRAM_ADDR,
            DRAM_BA    => DRAM_BA,
            DRAM_CAS_N => DRAM_CAS_N,
            DRAM_CKE   => DRAM_CKE,
            DRAM_CS_N  => DRAM_CS_N,
            DRAM_DQM   => DRAM_DQM,
            DRAM_DQ    => DRAM_DQ,
            DRAM_RAS_N => DRAM_RAS_N,
            DRAM_WE_N  => DRAM_WE_N
        );

    -- =========================================================================
    -- Geração do Clock de 50 MHz
    -- =========================================================================
    clk_process : process
    begin
        while now < 5 ms loop
            CLOCK_50 <= '0';
            wait for CLK_PERIOD / 2;
            CLOCK_50 <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- =========================================================================
    -- Mock (Simulador) do Chip SDRAM
    -- =========================================================================
    -- Responde aos comandos de leitura do controlador injetando dados.
    sdram_mock : process
    begin
        wait until falling_edge(DRAM_CLK);
        
        -- Detecta comando de READ (CS=0, RAS=1, CAS=0, WE=1)
        if DRAM_CS_N = '0' and DRAM_RAS_N = '1' and DRAM_CAS_N = '0' and DRAM_WE_N = '1' then
            -- Espera a latência CAS = 3
            wait until falling_edge(DRAM_CLK); -- Ciclo 1
            wait until falling_edge(DRAM_CLK); -- Ciclo 2
            wait until falling_edge(DRAM_CLK); -- Ciclo 3
            
            -- No 3º ciclo, o dado é injetado no barramento para o controlador ler
            DRAM_DQ <= x"42"; -- Injetamos o valor Hexadecimal 42 (Pode alterar para testar)
            
            -- Mantém o dado por 1 ciclo inteiro
            wait until falling_edge(DRAM_CLK);
            DRAM_DQ <= (others => 'Z'); -- Libera o barramento
        end if;
    end process;

    -- =========================================================================
    -- Estímulos do Usuário (Botões e Chaves)
    -- =========================================================================
    stim_proc : process
    begin
        -- 1. Reset Inicial
        report "Iniciando Teste - Aplicando Reset...";
        KEY(0) <= '0'; -- Pressiona o botão de reset
        wait for 100 ns;
        KEY(0) <= '1'; -- Solta o botão
        
        -- 2. Aguarda a inicialização do PLL e da SDRAM
        -- O PLL demora um pouco para dar 'locked' e o controlador tem o T_200US (atualmente 100 ciclos).
        report "Aguardando PLL e Inicializacao da DRAM...";
        wait for 3 us; 

        -- 3. Teste de ESCRITA
        -- Configura SW: Bank 1, Row 2, Col 3, Dado de entrada "A" (1010)
        -- SW(9) = 1 (Bank)
        -- SW(8..6) = 010 (Row)
        -- SW(5..4) = 11 (Col)
        -- SW(3..0) = 1010 (Data)
        report "Realizando operacao de ESCRITA...";
        SW <= "1" & "010" & "11" & "1010"; 
        wait for 50 ns;
        
        -- Pressiona KEY(3) para disparar a escrita no dram_iface
        KEY(3) <= '0'; 
        wait for 100 ns;
        KEY(3) <= '1'; -- Solta KEY(3)
        
        -- Aguarda tempo suficiente para a máquina de estados concluir a escrita
        wait for 1 us; 

        -- 4. Teste de LEITURA
        -- O dram_iface dispara a leitura quando percebe que os switches de endereço mudaram.
        -- Vamos mudar apenas o endereço e manter o data irrelevante.
        -- Mudando para: Bank 0, Row 0, Col 1
        report "Realizando operacao de LEITURA...";
        SW <= "0" & "000" & "01" & "0000"; 
        
        -- Aguarda o controlador processar a leitura e o mock da SDRAM devolver o x"42"
        wait for 1.5 us;
        
        report "Teste Finalizado. Verifique a Waveform para o sinal HEX0/HEX1.";
        wait;
    end process;

end architecture;