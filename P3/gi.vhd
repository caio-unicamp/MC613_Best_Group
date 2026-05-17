library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_controller is
    port (
        clk      : in    std_logic;
        rst      : in    std_logic;
        -- Interface com dram_iface
        address  : in    std_logic_vector(25 downto 0);
        data_in  : in    std_logic_vector(7 downto 0);  
        data_out : out   std_logic_vector(7 downto 0);  
        req      : in    std_logic;
        wEn      : in    std_logic;
        ready    : out   std_logic;

        -- Interface Física SDRAM para 64MX8
        dram_addr  : out   std_logic_vector(12 downto 0);
        dram_ba    : out   std_logic_vector(1 downto 0);
        dram_cas_n : out   std_logic;
        dram_cke   : out   std_logic;
        dram_cs_n  : out   std_logic;
        dram_dqm   : out   std_logic;    
        dram_dq    : inout std_logic_vector(7 downto 0);
        dram_ras_n : out   std_logic;    
        dram_we_n  : out   std_logic
    );
end entity;

architecture rtl of dram_controller is

    type state_type is (
        S_INIT_WAIT, S_INIT_PRECHARGE, S_INIT_REF_LOOP, S_INIT_LOAD_MODE, S_WAIT_MRD,
        S_IDLE, S_ACTIVATE, S_WAIT_RCD, S_READ_CMD, S_WAIT_CAS,
        S_WRITE_CMD, S_WAIT_DPL, S_PRECHARGE, S_WAIT_RP,
        S_REFRESH_CMD, S_WAIT_RC
    );
    signal state      : state_type;
    signal next_state : state_type;

    -- Constantes de Comandos
    constant CMD_NOP : std_logic_vector(3 downto 0) := "0111";
    constant CMD_ACT : std_logic_vector(3 downto 0) := "0011";
    constant CMD_RD  : std_logic_vector(3 downto 0) := "0101"; 
    constant CMD_WR  : std_logic_vector(3 downto 0) := "0100"; 
    constant CMD_PRE : std_logic_vector(3 downto 0) := "0010";
    constant CMD_REF : std_logic_vector(3 downto 0) := "0001";
    constant CMD_MRS : std_logic_vector(3 downto 0) := "0000";

    -- Constantes de Temporização
    constant T_200US  : integer := 100; 
    constant T_RCD    : integer := 2;     
    constant T_MRD    : integer := 2;     
    constant T_CAS    : integer := 3;     
    constant T_DPL    : integer := 2;     
    constant T_RP     : integer := 2;     
    constant T_RC     : integer := 9;     
    constant T_REFI   : integer := 1100;  

    -- Sinais de Controle (Gerados pela Lógica Combinacional para o Datapath)
    signal load_delay    : std_logic;
    signal next_delay_val: integer range 0 to 32767;
    signal set_ref_cnt   : std_logic;
    signal dec_ref_cnt   : std_logic;
    signal clear_init    : std_logic;
    signal clear_refresh : std_logic;
    signal latch_req     : std_logic;
    signal latch_data    : std_logic;
    signal set_dq_oe     : std_logic;
    signal update_dq_out : std_logic;

    -- Sinais do Datapath (Contadores e Registradores)
    signal delay_cnt     : integer range 0 to 32767;
    signal ref_init_cnt  : integer range 0 to 8;   
    signal refresh_timer : integer range 0 to 1200; 
    signal needs_refresh : boolean; 
    signal is_init       : boolean;
    signal req_addr      : std_logic_vector(25 downto 0);    
    signal req_data      : std_logic_vector(7 downto 0);
    signal req_is_w      : std_logic;
    signal dq_out        : std_logic_vector(7 downto 0);
    signal dq_oe         : std_logic; 
    
    -- Sinais Auxiliares para a Lógica Combinacional
    signal sdram_cmd      : std_logic_vector(3 downto 0);
    signal dram_addr_comb : std_logic_vector(12 downto 0);
    signal dram_ba_comb   : std_logic_vector(1 downto 0);

begin

    -- Mapeamento dos pinos fixos e de comando
    dram_cke   <= '1'; 
    dram_dqm   <= '0'; 
    dram_cs_n  <= sdram_cmd(3);
    dram_ras_n <= sdram_cmd(2);
    dram_cas_n <= sdram_cmd(1);
    dram_we_n  <= sdram_cmd(0);
    
    dram_addr  <= dram_addr_comb;
    dram_ba    <= dram_ba_comb;

    -- Buffer Tri-state
    dram_dq <= dq_out when dq_oe = '1' else (others => 'Z');


    -- =========================================================================
    -- PROCESSO 1: Sincronizador de Estado (Apenas muda o estado)
    -- =========================================================================
    process(clk, rst)
    begin
        if rst = '0' then 
            state <= S_INIT_WAIT;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;


    -- =========================================================================
    -- PROCESSO 2: Datapath e Contadores (Memória interna e temporal)
    -- =========================================================================
    process(clk, rst)
    begin
        if rst = '0' then 
            is_init       <= true;
            delay_cnt     <= T_200US;
            refresh_timer <= T_REFI;
            needs_refresh <= false;
            ref_init_cnt  <= 0;
            req_addr      <= (others => '0');
            req_data      <= (others => '0');
            req_is_w      <= '0';
            data_out      <= (others => '0');
            dq_out        <= (others => '0');
            dq_oe         <= '0';
            
        elsif rising_edge(clk) then
            -- 2.1 Lógica Base dos Contadores (Decremento Automático)
            if delay_cnt > 0 then
                delay_cnt <= delay_cnt - 1;
            end if;

            if not is_init then    
                if refresh_timer > 0 then   
                    refresh_timer <= refresh_timer - 1;
                else
                    refresh_timer <= T_REFI;
                    needs_refresh <= true;
                end if;
            end if;

            -- 2.2 Sinais de "Override" controlados pela FSM
            if load_delay = '1' then
                delay_cnt <= next_delay_val;
            end if;

            if set_ref_cnt = '1' then
                ref_init_cnt <= 8;
            elsif dec_ref_cnt = '1' then
                ref_init_cnt <= ref_init_cnt - 1;
            end if;

            if clear_init = '1' then
                is_init <= false;
            end if;

            if clear_refresh = '1' then
                needs_refresh <= false;
            end if;

            if latch_req = '1' then
                req_addr <= address;
                req_data <= data_in;
                req_is_w <= wEn;
            end if;

            if latch_data = '1' then
                data_out <= dram_dq;
            end if;

            if update_dq_out = '1' then
                dq_out <= req_data;
            end if;
            
            -- Lógica para garantir que o dq_oe suba exatamente junto com o dq_out
            if set_dq_oe = '1' then
                dq_oe <= '1';
            else
                dq_oe <= '0';
            end if;

        end if;
    end process;


    -- =========================================================================
    -- PROCESSO 3: Unidade de Controle FSM (Combinacional)
    -- =========================================================================
    -- Válido para VHDL-93: Todas as entradas lidas precisam estar na lista de sensibilidade
    process(state, delay_cnt, ref_init_cnt, needs_refresh, req, req_is_w, req_addr)
    begin
        -- 3.1 Valores Padrão (Evita a criação de Latches)
        next_state     <= state;
        sdram_cmd      <= CMD_NOP;
        ready          <= '0';
        dram_addr_comb <= (others => '0');
        dram_ba_comb   <= "00";

        load_delay     <= '0';
        next_delay_val <= 0;
        set_ref_cnt    <= '0';
        dec_ref_cnt    <= '0';
        clear_init     <= '0';
        clear_refresh  <= '0';
        latch_req      <= '0';
        latch_data     <= '0';
        set_dq_oe      <= '0';
        update_dq_out  <= '0';

        -- 3.2 Lógica de Próximo Estado e Saídas
        case state is
            when S_INIT_WAIT =>
                if delay_cnt = 0 then
                    next_state <= S_INIT_PRECHARGE;
                end if;

            when S_INIT_PRECHARGE =>
                sdram_cmd <= CMD_PRE;
                dram_addr_comb(10) <= '1'; 
                load_delay <= '1';
                next_delay_val <= T_RP;
                set_ref_cnt <= '1';
                next_state <= S_WAIT_RP;

            when S_INIT_REF_LOOP => 
                sdram_cmd <= CMD_REF;
                load_delay <= '1';
                next_delay_val <= T_RC;
                dec_ref_cnt <= '1';
                next_state <= S_WAIT_RC;

            when S_INIT_LOAD_MODE =>
                sdram_cmd <= CMD_MRS;
                dram_ba_comb <= "00";
                dram_addr_comb <= "000" & "1" & "00" & "011" & "0" & "000";  
                load_delay <= '1';
                next_delay_val <= T_MRD; 
                next_state <= S_WAIT_MRD;
                
            when S_WAIT_MRD =>
                if delay_cnt = 0 then
                    clear_init <= '1';
                    next_state <= S_IDLE;
                end if;

            when S_IDLE =>
                ready <= '1'; 
                if needs_refresh then   
                    ready <= '0';
                    next_state <= S_PRECHARGE;   
                elsif req = '1' then
                    ready <= '0';
                    latch_req <= '1'; -- Avisa o Datapath para capturar os dados do dram_iface
                    next_state <= S_ACTIVATE;
                end if;

            when S_ACTIVATE =>
                sdram_cmd <= CMD_ACT;
                dram_ba_comb   <= req_addr(25 downto 24); 
                dram_addr_comb <= req_addr(23 downto 11);  
                load_delay <= '1';
                next_delay_val <= T_RCD;
                next_state <= S_WAIT_RCD;

            when S_WAIT_RCD =>
                if delay_cnt = 0 then
                    if req_is_w = '1' then  
                        next_state <= S_WRITE_CMD;
                    else    
                        next_state <= S_READ_CMD;
                    end if;
                end if;

            when S_READ_CMD =>
                sdram_cmd <= CMD_RD;
                dram_ba_comb <= req_addr(25 downto 24);  
                dram_addr_comb <= '0' & req_addr(10) & '0' & req_addr(9 downto 0); 
                load_delay <= '1';
                next_delay_val <= T_CAS - 1;
                next_state <= S_WAIT_CAS;

            when S_WAIT_CAS =>
                if delay_cnt = 0 then
                    latch_data <= '1'; -- Avisa o Datapath para capturar o pino dram_dq
                    next_state <= S_PRECHARGE;
                end if;

            when S_WRITE_CMD =>
                sdram_cmd <= CMD_WR;
                dram_ba_comb <= req_addr(25 downto 24);  
                dram_addr_comb <= '0' & req_addr(10) & '0' & req_addr(9 downto 0);
                
                set_dq_oe <= '1';
                update_dq_out <= '1';
                
                load_delay <= '1';
                next_delay_val <= T_DPL;
                next_state <= S_WAIT_DPL;

            when S_WAIT_DPL =>
                set_dq_oe <= '1';
                update_dq_out <= '1';
                
                if delay_cnt = 0 then
                    next_state <= S_PRECHARGE;
                end if;

            when S_PRECHARGE =>
                sdram_cmd <= CMD_PRE;
                if needs_refresh then   
                    dram_addr_comb(10) <= '1';   
                else    
                    dram_ba_comb <= req_addr(25 downto 24);
                    dram_addr_comb(10) <= '0'; 
                end if;
                
                load_delay <= '1';
                next_delay_val <= T_RP;
                next_state <= S_WAIT_RP;

            when S_WAIT_RP =>
                if delay_cnt = 0 then
                    if needs_refresh then   
                        next_state <= S_REFRESH_CMD;
                    elsif ref_init_cnt > 0 then
                        next_state <= S_INIT_REF_LOOP; 
                    else    
                        next_state <= S_IDLE;
                    end if;
                end if;

            when S_REFRESH_CMD =>
                sdram_cmd <= CMD_REF;
                load_delay <= '1';
                next_delay_val <= T_RC;
                next_state <= S_WAIT_RC;

            when S_WAIT_RC =>
                if delay_cnt = 0 then
                    if needs_refresh then
                        clear_refresh <= '1';
                        next_state <= S_IDLE;    
                    elsif ref_init_cnt > 0 then
                        next_state <= S_INIT_REF_LOOP; 
                    else
                        next_state <= S_INIT_LOAD_MODE;  
                    end if;
                end if;

            when others =>
                next_state <= S_INIT_WAIT;
        end case;
    end process;

end architecture;