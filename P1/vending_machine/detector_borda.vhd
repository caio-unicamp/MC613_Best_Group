library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detector_borda is
    Port (
        clk       : in  STD_LOGIC;
        botao_in  : in  STD_LOGIC;  -- Botão pressionado
        pulso_out : out STD_LOGIC
    );
end detector_borda;

architecture Behavioral of detector_borda is
    signal estado_atual    : STD_LOGIC := '1'; -- Botão solto
    signal estado_anterior : STD_LOGIC := '1'; 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            estado_anterior <= estado_atual;
            estado_atual    <= botao_in; -- Pressionou => estado_atual = 0
        end if;
    end process;

    -- Gera um pulso de 1 ciclo de clock na transição de descida (1 -> 0)
    pulso_out <= '1' when (estado_anterior = '1' and estado_atual = '0') else '0';
end Behavioral;