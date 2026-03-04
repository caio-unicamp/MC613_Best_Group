library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity multiplier is
    Generic (
        N : integer := 5  -- Tamanho dos operandos em bits
    );
    Port (
        clk : in STD_LOGIC;                           -- Clock da placa (50 MHz)
        set : in STD_LOGIC;                           -- Sinal para iniciar nova multiplicação
        a : in STD_LOGIC_VECTOR(N-1 downto 0);       -- Multiplicando
        b : in STD_LOGIC_VECTOR(N-1 downto 0);       -- Multiplicador
        r : out STD_LOGIC_VECTOR(2*N-1 downto 0)     -- Resultado
    );
end multiplier;

architecture Behavioral of multiplier is
    signal num_1 : unsigned(2*N-1 downto 0);         -- Multiplicando estendido
    signal num_2 : unsigned(N-1 downto 0);           -- Multiplicador
    signal out_reg : unsigned(2*N-1 downto 0);       -- Acumulador do resultado
    signal counter : integer range 0 to N;           -- Contador de ciclos
    -- signal counter : integer range 0 to N;        (Duplicado)   
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if set = '1' then
                num_1 <= resize(unsigned(a), 2*N);   -- Estende multiplicando
                -- num_1 <= resize(unsigned(a), 10); (Redundante pois N = 5)
                num_2 <= unsigned(b);
                counter <= 0;
                out_reg <= (others => '0');
                r <= (others => '0');
            else
                if counter < N then
                    if num_2(0) = '1' then
                        out_reg <= out_reg + num_1;
                    end if;
                    num_1 <= shift_left(num_1, 1);    -- Desloca multiplicando
                    num_2 <= shift_right(num_2, 1);   -- Desloca multiplicador
                    counter <= counter + 1;
                else
                    r <= STD_LOGIC_VECTOR(out_reg);
                end if;
            end if;
        end if;
    end process;
end Behavioral;
