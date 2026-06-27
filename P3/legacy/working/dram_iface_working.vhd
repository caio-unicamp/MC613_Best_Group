library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_iface is
    port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        -- Entradas da placa (Atualizado para 9 downto 0 para acessar os bits de dados)
        SW       : in  std_logic_vector(9 downto 0);
        KEY      : in  std_logic_vector(3 downto 0);
        -- Sinal de controle da DRAM
        ready    : in  std_logic;
        
        -- Sinais de saída
        HEX0     : out std_logic_vector(6 downto 0);
        HEX1     : out std_logic_vector(6 downto 0);
        HEX4     : out std_logic_vector(6 downto 0);
        HEX5     : out std_logic_vector(6 downto 0);

        address  : out std_logic_vector(25 downto 0);
        data     : inout std_logic_vector(7 downto 0);

        req      : out std_logic;
        wEn      : out std_logic
    );
end dram_iface;

architecture rtl of dram_iface is

    -- Definição dos estados da FSM
    type state_type is (
        ST_RESET,
        ST_READY,
        ST_REQ_WRITE,
        ST_WAIT_WRITE,
        ST_REQ_READ,
        ST_WAIT_READ
    );

    signal state, next_state : state_type;
    
    -- Registrador para detectar mudança no endereço
    signal sw_reg   : std_logic_vector(9 downto 4);
    
    -- Registrador para armazenar o dado lido
    signal data_reg : std_logic_vector(7 downto 0);

    -- Sinal auxiliar para o HEX5
    signal hex5_in  : std_logic_vector(3 downto 0);

    -- =========================================================================
    -- Declaração do componente bin2hex
    -- =========================================================================
    component bin2hex is
        port (
            BIN : in  std_logic_vector(3 downto 0);
            HEX : out std_logic_vector(6 downto 0)
        );
    end component;

begin

    -- =========================================================================
    -- 1. Processo Sequencial: Atualização de Estado e Registradores
    -- =========================================================================
    process(clk, rst)
    begin
        if rst = '1' then 
            state <= ST_RESET;
            sw_reg <= (others => '0');
            data_reg <= (others => '0');
            
        elsif rising_edge(clk) then
            state <= next_state;
            
            -- Atualiza referência de chaves e o dado lido ao final de uma leitura
            if state = ST_WAIT_READ and ready = '1' then
                sw_reg <= SW(9 downto 4);
                
                -- Ignora data(7 downto 4) forçando "0000", armazena apenas data(3 downto 0)
                data_reg <= "0000" & data(3 downto 0);
            end if;
        end if;
    end process;

    -- =========================================================================
    -- 2. Processo Combinacional: Lógica de Próximo Estado
    -- =========================================================================
    process(state, ready, KEY, SW, sw_reg)
    begin
        next_state <= state; 

        case state is
            when ST_RESET =>
                if ready = '1' then
                    next_state <= ST_READY;
                end if;

            when ST_READY =>
                if KEY(3) = '0' and ready = '1' then
                    next_state <= ST_REQ_WRITE;
                    
                -- Leitura: Mudança nos switches de ENDEREÇO (SW[9:4])
                elsif SW(9 downto 4) /= sw_reg and ready = '1' then
                    next_state <= ST_REQ_READ;
                end if;

            when ST_REQ_WRITE =>
                next_state <= ST_WAIT_WRITE;

            when ST_WAIT_WRITE =>
                if ready = '1' then
                    next_state <= ST_REQ_READ;
                else
                    next_state <= ST_WAIT_WRITE;
                end if;

            when ST_REQ_READ =>
                next_state <= ST_WAIT_READ;

            when ST_WAIT_READ =>
                if ready = '1' then
                    next_state <= ST_READY;
                else
                    next_state <= ST_WAIT_READ;
                end if;

            when others =>
                next_state <= ST_RESET;
        end case;
    end process;

    -- =========================================================================
    -- 3. Lógica de Interface com a DRAM e Placa
    -- =========================================================================
    req <= '1' when (state = ST_REQ_WRITE or state = ST_REQ_READ) else '0';
    wEn <= '1' when (state = ST_REQ_WRITE or state = ST_WAIT_WRITE) else '0';

    -- Mapeamento do endereço: 
    -- SW[9] -> bit 25; SW[8:6] -> bits 23:21; SW[5:4] -> bits 1:0
    address <= SW(9) & '0' & SW(8 downto 6) & "0000000000000000000" & SW(5 downto 4);

    -- Barramento Bidirecional (Tristate Buffer)
    -- Escreve ("0000" & SW[3:0]) na gravação, alta impedância ('Z') na leitura/espera
    data <= "0000" & SW(3 downto 0) when (state = ST_REQ_WRITE or state = ST_WAIT_WRITE) else (others => 'Z');

    -- =========================================================================
    -- 4. Instanciação dos Displays usando bin2hex
    -- =========================================================================
    
    -- Ajusta os 2 bits mais significativos do endereço para entrar no módulo de 4 bits
    hex5_in <= "00" & SW(9 downto 8);
    
    inst_hex5: bin2hex port map (BIN => hex5_in,        HEX => HEX5);
    inst_hex4: bin2hex port map (BIN => SW(7 downto 4), HEX => HEX4);

    -- HEX1 exibirá "0" constante, pois forçamos "0000" em data_reg(7 downto 4)
    inst_hex1: bin2hex port map (BIN => data_reg(7 downto 4), HEX => HEX1);
    
    -- HEX0 exibe o dado efetivo lido da memória (apenas os 4 bits da direita)
    inst_hex0: bin2hex port map (BIN => data_reg(3 downto 0), HEX => HEX0);

end rtl;