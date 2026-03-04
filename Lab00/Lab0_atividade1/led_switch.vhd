-- Módulo que conecta switches aos LEDs
-- Atividade 1 - Primeiro circuito
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_switch is
    Port (
        -- Entradas: 10 switches da placa
        SW : in STD_LOGIC_VECTOR(9 downto 0);
        
        -- Saídas: 10 LEDs vermelhos da placa
        LEDR : out STD_LOGIC_VECTOR(9 downto 0)
    );
end led_switch;

architecture Behavioral of led_switch is
begin
    -- Conexão direta: cada switch controla seu LED correspondente
    -- SW(0) -> LEDR(0), SW(1) -> LEDR(1), etc.
    LEDR <= SW;
end Behavioral;
