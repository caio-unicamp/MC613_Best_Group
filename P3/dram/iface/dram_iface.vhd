library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_iface is
    port (
        clk      : in  std_logic;
        -- Entradas da placa
        KEY      : in  std_logic_vector(3 downto 0);
        SW       : in  std_logic_vector(9 downto 4);
        -- Sinal de controle da DRAM
        ready    : in  std_logic;
        
        -- Sinais de saída
        write_req: out std_logic;
        read_req : out std_logic
    );
end dram_iface;

architecture rtl of dram_iface is

    -- Estados simplificados conforme solicitado
    type state_type is (
        ST_RESET,
        ST_READY,
        ST_REQ_WRITE,
        ST_WAIT_WRITE,
        ST_REQ_READ,
        ST_WAIT_READ
    );

    signal state, next_state : state_type;
    
    -- Registrador para armazenar o valor anterior de SW[9:4]
    signal sw_reg : std_logic_vector(9 downto 4);

begin

    -- 1. Processo Sequencial: Atualização de Estado e Registradores
    process(clk, KEY(0))
    begin
        -- Reset assíncrono (KEY[0] pressionado = '0')
        if KEY(0) = '0' then 
            state <= ST_RESET;
            sw_reg <= (others => '0');
            
        elsif rising_edge(clk) then
            state <= next_state;
            
            -- O "update" ocorre aqui: quando a leitura termina, salvamos o valor atual das chaves
            if state = ST_WAIT_READ and ready = '1' then
                sw_reg <= SW;
            end if;
        end if;
    end process;

    -- 2. Processo Combinacional: Lógica de Próximo Estado
    process(state, ready, KEY, SW, sw_reg)
    begin
        next_state <= state; 

        case state is
            when ST_RESET =>
                if ready = '1' then
                    next_state <= ST_READY;
                end if;

            when ST_READY =>
                -- Prioridade para escrita: KEY[3] pressionado AND ready = 1
                if KEY(3) = '0' and ready = '1' then
                    next_state <= ST_REQ_WRITE;
                    
                -- Leitura: Mudança nas chaves AND ready = 1
                elsif SW /= sw_reg and ready = '1' then
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
                    -- Retorno direto para READY
                    next_state <= ST_READY;
                else
                    next_state <= ST_WAIT_READ;
                end if;

            when others =>
                next_state <= ST_RESET;
        end case;
    end process;

    -- 3. Lógica de Saída
    write_req <= '1' when state = ST_REQ_WRITE else '0';
    read_req  <= '1' when state = ST_REQ_READ  else '0';

end rtl;