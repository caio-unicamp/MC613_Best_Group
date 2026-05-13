library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_iface_tb is
end dram_iface_tb;

architecture sim of dram_iface_tb is
    -- Sinais de interface com a UUT
    signal clk      : std_logic := '0';
    signal rst      : std_logic := '0';
    
    -- SW agora com 10 bits: (9 downto 4) endereço, (3 downto 0) dado
    signal SW       : std_logic_vector(9 downto 0) := (others => '0'); 
    signal KEY      : std_logic_vector(3 downto 0) := "1111";
    signal ready    : std_logic := '0'; -- Começa em 0 para simular boot da DRAM
    
    -- Saídas para observação
    signal HEX0, HEX1, HEX4, HEX5 : std_logic_vector(6 downto 0);
    signal address  : std_logic_vector(25 downto 0);
    signal data     : std_logic_vector(7 downto 0) := (others => 'Z'); 
    signal req      : std_logic;
    signal wEn      : std_logic;

    constant clk_period : time := 20 ns;

begin

    -- Instanciação da Unidade Sob Teste (UUT)
    uut: entity work.dram_iface
        port map (
            clk     => clk,
            rst     => rst,
            SW      => SW,
            KEY     => KEY,
            ready   => ready,
            HEX0    => HEX0,
            HEX1    => HEX1,
            HEX4    => HEX4,
            HEX5    => HEX5,
            address => address,
            data    => data,
            req     => req,
            wEn     => wEn
        );

    -- Gerador de Clock (50 MHz)
    clk_process : process
    begin
        clk <= '0'; wait for clk_period/2;
        clk <= '1'; wait for clk_period/2;
    end process;

    -- Processo de Estímulos
    stim_proc: process
    begin        
        -- --- CENÁRIO 1: Reset e Preparação ---
        report "Iniciando Reset...";
        rst <= '1';          -- Ativa o reset (ativo em alto)
        wait for 40 ns;
        rst <= '0';          -- Solta o reset
        wait for 20 ns;
        
        report "DRAM ficando pronta...";
        ready <= '1';        -- Permite que a FSM vá para ST_READY
        wait for clk_period * 2;

        -- --- CENÁRIO 2: Escrita de Dado (KEY3) ---
        report "Simulando comando de Escrita (KEY3)...";
        -- Endereço: 110011 (SW 9-4) | Dado: 1010 (SW 3-0 = 0xA)
        SW <= "1100111010"; 
        wait for clk_period * 2;
        
        KEY(3) <= '0';       -- Aperta botão de escrita (active low)
        wait for clk_period;
        KEY(3) <= '1';       -- Solta botão
        
        -- Simula latência da DRAM durante a escrita
        ready <= '0';        -- DRAM ocupada processando a gravação
        wait for clk_period * 3;
        ready <= '1';        -- DRAM terminou. Agora a FSM deve ir para Auto-Leitura
        
        -- --- CENÁRIO 3: Resposta da Leitura Automática ---
        -- Espera entrar em leitura (onde req=1 e wEn=0)
        wait until req = '1' and wEn = '0';
        report "Auto-Leitura detectada, injetando dado no barramento...";
        data <= "00001010";  -- Simula a memória enviando o dado 0xA lido
        wait for clk_period * 2;
        ready <= '1';        -- Finaliza o ciclo de leitura
        wait for clk_period;
        data <= (others => 'Z'); -- Importante: solta o barramento!

        -- --- CENÁRIO 4: Leitura por Mudança de Endereço ---
        report "Simulando mudança manual de SW (Endereço novo)...";
        wait for clk_period * 5;
        -- Muda o endereço (bits superiores), mantém dado igual
        SW <= "0011001010"; 
        
        wait until req = '1';
        data <= "00000101";  -- Simula que neste novo endereço existe o valor 0x5
        wait for clk_period * 2;
        ready <= '1';
        wait for clk_period;
        data <= (others => 'Z');

        report "Simulação finalizada com sucesso!";
        wait; -- Trava o processo para a simulação não reiniciar
    end process;

end sim;