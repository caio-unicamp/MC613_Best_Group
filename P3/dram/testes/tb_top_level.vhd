
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_top_level is
end entity;

architecture sim of tb_top_level is

    -- Componente do Top Level
    component top_level is
        port (
            CLOCK_50   : in  std_logic;
            KEY        : in  std_logic_vector(3 downto 0);
            SW         : in  std_logic_vector(9 downto 0);
            HEX0       : out std_logic_vector(6 downto 0);
            HEX1       : out std_logic_vector(6 downto 0);
            HEX4       : out std_logic_vector(6 downto 0);
            HEX5       : out std_logic_vector(6 downto 0);
            LEDR       : out std_logic_vector(9 downto 0);
            DRAM_CLK   : out std_logic;
            DRAM_ADDR  : out std_logic_vector(12 downto 0);
            DRAM_BA    : out std_logic_vector(1 downto 0);
            DRAM_CAS_N : out std_logic;
            DRAM_CKE   : out std_logic;
            DRAM_CS_N  : out std_logic;
            DRAM_LDQM  : out std_logic;
            DRAM_UDQM  : out std_logic;
            DRAM_DQ    : inout std_logic_vector(15 downto 0);
            DRAM_RAS_N : out std_logic;
            DRAM_WE_N  : out std_logic
        );
    end component;

    -- Sinais de Estímulo
    signal CLOCK_50 : std_logic := '0';
    signal KEY      : std_logic_vector(3 downto 0) := "1111"; -- Botões não pressionados (ativo em BAIXO)
    signal SW       : std_logic_vector(9 downto 0) := (others => '0');

    -- Sinais de Monitoramento
    signal HEX0, HEX1, HEX4, HEX5 : std_logic_vector(6 downto 0);
    signal LEDR : std_logic_vector(9 downto 0);

    -- Sinais Físicos da SDRAM
    signal DRAM_CLK, DRAM_CAS_N, DRAM_CKE, DRAM_CS_N : std_logic;
    signal DRAM_LDQM, DRAM_UDQM, DRAM_RAS_N, DRAM_WE_N : std_logic;
    signal DRAM_ADDR : std_logic_vector(12 downto 0);
    signal DRAM_BA   : std_logic_vector(1 downto 0);
    signal DRAM_DQ   : std_logic_vector(15 downto 0);

    -- Sinal Mock para a porta inout da SDRAM
    signal mock_dq_drive : std_logic_vector(15 downto 0) := (others => 'Z');

    -- Controle da simulação
    constant CLK_50_PERIOD : time := 20 ns;
    signal sim_done : boolean := false;

begin

    -- Instanciação do Top Level
    DUT: top_level
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
            DRAM_LDQM  => DRAM_LDQM,
            DRAM_UDQM  => DRAM_UDQM,
            DRAM_DQ    => DRAM_DQ,
            DRAM_RAS_N => DRAM_RAS_N,
            DRAM_WE_N  => DRAM_WE_N
        );

    -- Drive do barramento bidirecional
    DRAM_DQ <= mock_dq_drive;

    -- Geração do Clock Principal (50 MHz)
    clk_process : process
    begin
        while not sim_done loop
            CLOCK_50 <= '0';
            wait for CLK_50_PERIOD / 2;
            CLOCK_50 <= '1';
            wait for CLK_50_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Processo Principal de Estímulos
    stimulus: process
    begin
        report "=================================================";
        report " INICIANDO SIMULACAO DO TOP LEVEL";
        report "=================================================";

        -- 1. Reset Global via KEY(0)
        -- KEY(0) em '0' significa botão pressionado (reseta o sistema e o PLL)
        KEY(0) <= '0';
        wait for 100 ns;
        KEY(0) <= '1'; -- Libera reset
        
        report "[LOG] Reset liberado. Aguardando a inicializacao de 200us da SDRAM...";

        -- Aguarda o controlador ficar READY monitorando o LEDR(7) que você mapeou!
        wait until LEDR(7) = '1';
        report "[LOG] Inicializacao concluida! Sistema Pronto (LEDR(7) = ON).";

        wait for 200 ns;

        ---------------------------------------------------------
        -- 2. TESTE DE ESCRITA VIA BOTÃO (KEY 3)
        ---------------------------------------------------------
        report "-------------------------------------------------";
        report "[TESTE 1] Testando operacao de ESCRITA...";
        
        -- Configura as chaves: 
        -- SW(9 downto 4) = Endereço ("000001")
        -- SW(3 downto 0) = Dado ("1010" -> Hexadecimal 'A')
        SW <= "000001" & "1010"; 
        wait for 250 ns;

        -- Pressiona KEY(3)
        report "[LOG] Pressionando KEY(3)...";
        KEY(3) <= '0';
        wait for 100 ns; -- Mantém pressionado por alguns clocks
        KEY(3) <= '1';   -- Solta o botão

        -- O sistema deve baixar o LEDR(7) indicando que está ocupado
        wait until LEDR(7) = '0';
        report "[LOG] Controlador processando escrita (LEDR(7) = OFF)...";

        -- Aguarda terminar a operação
        wait until LEDR(7) = '1';
        report "[TESTE 1] Escrita finalizada (LEDR(7) = ON novamente).";

        wait for 200 ns;

        ---------------------------------------------------------
        -- 3. TESTE DE LEITURA POR MUDANÇA DE CHAVE
        ---------------------------------------------------------
        report "-------------------------------------------------";
        report "[TESTE 2] Testando operacao de LEITURA (Mudanca de SW)...";
        
        -- O seu dram_iface dispara leitura automaticamente se SW(9 downto 4) mudar
        -- Vamos mudar o endereço para "000010" mantendo o dado em "0000"
        SW <= "000010" & "0000"; 
        
        -- Isso deve engatilhar uma leitura na FSM do dram_iface
        wait until LEDR(7) = '0';
        report "[LOG] Leitura detectada pelo dram_iface! Controlador ocupado...";

        -- Injetamos um dado falso no barramento DRAM_DQ (Ex: 0x000F, queremos ler o 'F')
        -- O dado é lido alguns clocks depois, deixamos ele lá durante a operação
        mock_dq_drive <= x"000F";

        wait until LEDR(7) = '1';
        mock_dq_drive <= (others => 'Z'); -- Libera o barramento
        
        report "[TESTE 2] Leitura finalizada.";
        
        wait for 100 ns;

        -- Verifica se o display HEX0 está mostrando 'F' (0001110)
        -- O valor lido do barramento deve ter sido salvo no data_reg e jogado no HEX0 e HEX1
        if HEX1 = "0001110" then
            report "[SUCESSO] Display HEX1 exibindo 'F' corretamente!" severity note;
        else
            report "[FALHA] Display HEX1 nao exibe o valor esperado." severity error;
        end if;

        ---------------------------------------------------------
        -- FINALIZANDO
        ---------------------------------------------------------
        report "=================================================";
        report " SIMULACAO DO TOP LEVEL CONCLUIDA";
        report "=================================================";
        sim_done <= true;
        wait;
    end process;

end architecture;