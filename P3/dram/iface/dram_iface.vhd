library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_iface is
    port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        SW       : in  std_logic_vector(9 downto 0);
        KEY      : in  std_logic_vector(3 downto 0);
        ready    : in  std_logic;
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
    type state_type is (ST_RESET, ST_READY, ST_REQ_WRITE, ST_WAIT_DONE, ST_REQ_READ);
    signal state : state_type;
    signal sw_reg   : std_logic_vector(9 downto 4);
    signal data_reg : std_logic_vector(7 downto 0);

    component bin2hex is
        port (
            BIN : in  std_logic_vector(3 downto 0);
            HEX : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    process(clk, rst)
    begin
        if rst = '0' then 
            state <= ST_RESET;
            sw_reg <= (others => '0');
            data_reg <= (others => '0');
            req <= '0';
            wEn <= '0';
        elsif rising_edge(clk) then
            case state is
                when ST_RESET =>
                    if ready = '1' then state <= ST_READY; end if;

                when ST_READY =>
                    req <= '0';
                    if KEY(3) = '0' then -- Botão de Escrita
                        state <= ST_REQ_WRITE;
                    elsif SW(9 downto 4) /= sw_reg then -- Mudança de endereço dispara leitura
                        state <= ST_REQ_READ;
                    end if;

                when ST_REQ_WRITE =>
                    req <= '1';
                    wEn <= '1';
                    if ready = '0' then -- Controlador aceitou
                        state <= ST_WAIT_DONE;
                    end if;

                when ST_REQ_READ =>
                    req <= '1';
                    wEn <= '0';
                    if ready = '0' then -- Controlador aceitou
                        state <= ST_WAIT_DONE;
                    end if;

                when ST_WAIT_DONE =>
                    req <= '0'; -- Handshake: abaixa o req
                    if ready = '1' then -- Operação concluída
                        sw_reg <= SW(9 downto 4);
                        data_reg <= data; -- Captura o dado lido
                        state <= ST_READY;
                    end if;
            end case;
        end if;
    end process;

    address <= SW(9) & '0' & SW(8 downto 6) & "0000000000000000000" & SW(5 downto 4);
    
    -- Direção do dado: Iface só dirige o barramento durante a fase de requisição de escrita
    data <= "0000" & SW(3 downto 0) when (state = ST_REQ_WRITE and wEn = '1') else (others => 'Z');

    inst_hex5: bin2hex port map (BIN => "00" & SW(9 downto 8), HEX => HEX5);
    inst_hex4: bin2hex port map (BIN => SW(7 downto 4),       HEX => HEX4);
    inst_hex1: bin2hex port map (BIN => data_reg(7 downto 4), HEX => HEX1);
    inst_hex0: bin2hex port map (BIN => data_reg(3 downto 0), HEX => HEX0);
end rtl;