library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vending_machine is
    Port(
        CLOCK_50 : in STD_LOGIC;
        KEY      : in STD_LOGIC_VECTOR(3 downto 0); -- KEY(0): Avançar/Confirmar, KEY(1): Cancelar
        SW       : in STD_LOGIC_VECTOR(9 downto 0); -- SW(3:0): Produto, SW(9:4): Moedas
        HEX0     : out STD_LOGIC_VECTOR(6 downto 0);
        HEX1     : out STD_LOGIC_VECTOR(6 downto 0);
        HEX2     : out STD_LOGIC_VECTOR(6 downto 0);
        HEX3     : out STD_LOGIC_VECTOR(6 downto 0);
        HEX5     : out STD_LOGIC_VECTOR(6 downto 0); 
        LEDR     : out STD_LOGIC_VECTOR(9 downto 0)
    );
end vending_machine;

architecture Behavioral of vending_machine is
    -- Sinais internos para interconexão
    signal s_avancar, s_cancelar : std_logic;
    signal s_moeda_valida : std_logic;
    signal s_valor_moeda : std_logic_vector(10 downto 0);
    signal s_valor_produto : std_logic_vector(10 downto 0);
    
    signal s_clr_acumula : std_logic;
    signal s_venda_concluida : std_logic;
    signal s_done_timer: std_logic;
    signal s_reset_timer: std_logic;
    signal s_saldo_restante : std_logic_vector(10 downto 0);
    signal s_valor_troco : std_logic_vector(10 downto 0);
    signal s_valor_acumulado : std_logic_vector(10 downto 0);
    
    signal s_estado : std_logic_vector(2 downto 0);
    signal s_valor_para_display : std_logic_vector(10 downto 0);

begin

    -- 1. Temporizador de 1 segundo (Instanciação interna ou componente externo)
    timer_inst: entity work.delay_1s
        port map(
            clk         => CLOCK_50,
            reset_timer => s_reset_timer,
            done_timer  => s_done_timer
        );

    -- 2. Detectores de Borda para os botões de controle
    debouncer_avancar: entity work.detector_borda
        port map(clk => CLOCK_50, botao_in => KEY(0), pulso_out => s_avancar);

    debouncer_cancelar: entity work.detector_borda
        port map(clk => CLOCK_50, botao_in => KEY(1), pulso_out => s_cancelar);

    -- 3. Decodificador de Moedas
    decoder_m: entity work.decode_moedas
        port map(
            sw_moedas => SW(9 downto 4), 
            valor_moeda => s_valor_moeda, 
            moeda_valida => s_moeda_valida
        );

    -- 4. Valor do Produto (Baseado nos Switches 3 a 0)
    -- Nota: Você precisará do componente 'produto_valor' ou lógica similar
    prod_val: entity work.produto_valor
        port map(
            codigo_produto => SW(3 downto 0),
            valor_produto => s_valor_produto
        );

    -- 5. Máquina de Estados
    fsm: entity work.maquina_estados
        port map(
            clk => CLOCK_50,
            avancar => s_avancar,
            cancelar => s_cancelar,
            valor_acumulado => s_valor_acumulado,
            saldo_suficiente => s_saldo_restante, -- Usado para lógica interna
            troco => s_valor_troco,
            done_timer => s_done_timer,
            reset_timer => s_reset_timer,
            estado_out => s_estado,
            clr_acumula => s_clr_acumula
        );

    -- 6. Acumulador e Cálculo de Saldo/Troco
    acc: entity work.maquina_acumulador
        port map(
            clk => CLOCK_50,
            clr_acumula => s_clr_acumula,
            enable_acumula => s_moeda_valida and s_avancar, -- Exemplo de trigger
            valor_produto => s_valor_produto,
            valor_moeda => s_valor_moeda,
            saldo_restante => s_saldo_restante,
            valor_troco => s_valor_troco,
            valor_acumulado => s_valor_acumulado,
            venda_concluida => s_venda_concluida
        );

    -- 7. Seletor do que exibir nos displays (Mux)
    mux_disp: entity work.mux_display_selector
        port map(
            estado => s_estado,
            saldo_restante => s_saldo_restante,
            valor_troco => s_valor_troco,
            valor_acumulado => s_valor_acumulado,
            saida_bin => s_valor_para_display
        );

    -- 8. Driver dos Displays HEX0-HEX3 (Valor Numérico)
    display_val: entity work.hex_display_valor
        port map(
            bin_in => s_valor_para_display,
            HEX_0 => HEX0, HEX_1 => HEX1, HEX_2 => HEX2, HEX_3 => HEX3
        );

    -- 9. Mostrar o código do produto no HEX5
    display_estado: entity work.bin2hex
        port map(
            BIN => SW(3 downto 0),
            HEX => HEX5
        );

    -- 10. Feedback visual nos LEDs
    LEDR(0) <= '1' when s_estado = "010" else '0'; -- "010" é o estado 'dispensar'
    LEDR(1) <= '1' when (s_estado = "011" or s_estado = "100") else '0'; -- 'devolver_normal' ou 'devolver_troco'

end Behavioral;