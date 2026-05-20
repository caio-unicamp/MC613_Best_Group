library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_iface is
    port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        -- Entradas da placa
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

    -- Adicionamos estados de SETUP para garantir 1 ciclo de estabilidade no endereço
    type state_type is (
        ST_RESET,
        ST_READY,
        ST_SETUP_WRITE,
        ST_REQ_WRITE,
        ST_WAIT_WRITE,
        ST_SETUP_READ,
        ST_REQ_READ,
        ST_WAIT_READ
    );

    signal state, next_state : state_type;
    
    signal sw_reg   : std_logic_vector(9 downto 4);
    signal data_reg_rd : std_logic_vector(3 downto 0);

    signal hex5_in  : std_logic_vector(3 downto 0);
    signal k3_now   : std_logic;
    signal k3_last  : std_logic;

    -- Latches
    signal addr_latched : std_logic_vector(25 downto 0);
    signal data_latched : std_logic_vector(7 downto 0);

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
        if rst = '0' then 
            state <= ST_RESET;
            sw_reg <= (others => '0');
            data_reg_rd <= (others => '0');
            k3_now <= '1';
            k3_last <= '1';
            addr_latched <= (others => '0');
            data_latched <= (others => '0');
            
        elsif rising_edge(clk) then
            state <= next_state;
            k3_last <= k3_now;
            k3_now <= KEY(3);
            
            if state = ST_READY and ready = '1' then
                -- WRITE
                if (k3_last = '1' and k3_now = '0') then
                    addr_latched <= SW(9) & '0' & SW(8 downto 6) & "0000000000000000000" & SW(5 downto 4);
                    data_latched <= "0000" & SW(3 downto 0);

                -- READ
                elsif SW(9 downto 4) /= sw_reg then
                    addr_latched <= SW(9) & '0' & SW(8 downto 6) & "0000000000000000000" & SW(5 downto 4);
                    -- FIX: Atualiza a referência de mudança ANTES da leitura.
                    -- Isso impede que o bounce da chave cause leituras infinitas.
                    sw_reg <= SW(9 downto 4); 
                end if;
            end if;

            if state = ST_WAIT_READ and ready = '1' then
                -- Salva apenas o dado (sw_reg já foi atualizado no inicio)
                data_reg_rd <= data(3 downto 0);
            end if;
        end if;
    end process;

    -- =========================================================================
    -- 2. Processo Combinacional: Lógica de Próximo Estado
    -- =========================================================================
    process(state, ready, KEY, SW, sw_reg, k3_last, k3_now)
    begin
        next_state <= state; 

        case state is
            when ST_RESET =>
                if ready = '1' then
                    next_state <= ST_READY;
                end if;

            when ST_READY =>
                if (k3_last = '1' and k3_now = '0') and ready = '1' then
                    next_state <= ST_SETUP_WRITE;
                elsif SW(9 downto 4) /= sw_reg and ready = '1' then
                    next_state <= ST_SETUP_READ;
                end if;

            -- ESTADOS NOVOS: Apenas 1 ciclo de espera para o endereço estabilizar
            when ST_SETUP_WRITE => next_state <= ST_REQ_WRITE;
            when ST_SETUP_READ  => next_state <= ST_REQ_READ;

            when ST_REQ_WRITE =>
                if ready = '0' then
                    next_state <= ST_WAIT_WRITE;
                end if;

            when ST_WAIT_WRITE =>
                if ready = '1' then
                    next_state <= ST_SETUP_READ; -- Vai ler após gravar, com setup time
                else
                    next_state <= ST_WAIT_WRITE;
                end if;

            when ST_REQ_READ =>
                if ready = '0' then
                    next_state <= ST_WAIT_READ;
                end if;

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
    -- 3. Lógica de Interface
    -- =========================================================================
    -- REQ só vai para '1' DEPOIS do ciclo de Setup
    req <= '1' when (state = ST_REQ_WRITE or state = ST_REQ_READ or state = ST_WAIT_WRITE or state = ST_WAIT_READ) else '0';
    
    wEn <= '1' when (state = ST_REQ_WRITE or state = ST_WAIT_WRITE) else '0';

    address <= addr_latched;

    -- O dado fica disponível já durante o setup para também garantir Data Setup Time
    data <= data_latched when (state = ST_SETUP_WRITE or state = ST_REQ_WRITE or state = ST_WAIT_WRITE) else (others => 'Z');

    -- =========================================================================
    -- 4. Instanciação dos Displays
    -- =========================================================================
    hex5_in <= "00" & SW(9 downto 8);
    
    inst_hex5: bin2hex port map (BIN => hex5_in,        HEX => HEX5);
    inst_hex4: bin2hex port map (BIN => SW(7 downto 4), HEX => HEX4);
    inst_hex1: bin2hex port map (BIN => data_reg_rd,    HEX => HEX1);
    inst_hex0: bin2hex port map (BIN => SW(3 downto 0), HEX => HEX0);

end rtl;