library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_board is
    Port (
        CLOCK_50 : in STD_LOGIC;                      -- Clock de 50MHz da placa
        KEY : in STD_LOGIC_VECTOR(3 downto 0);       -- Botões (KEY(0) inicia multiplicação)
        SW : in STD_LOGIC_VECTOR(9 downto 0);        -- Switches (SW(9:5)=A, SW(4:0)=B)
        HEX0 : out STD_LOGIC_VECTOR(6 downto 0);     -- Displays para mostrar resultado
        HEX1 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX2 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX3 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX4 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX5 : out STD_LOGIC_VECTOR(6 downto 0)
    );
end multiplier_board;

architecture Behavioral of multiplier_board is
    signal r : STD_LOGIC_VECTOR(9 downto 0);         -- Resultado da multiplicação
    signal num_1_display : STD_LOGIC_VECTOR(7 downto 0);
    signal num_2_display : STD_LOGIC_VECTOR(7 downto 0);
    signal set_signal : STD_LOGIC;
begin
    -- Botão pressionado = '0', queremos '1'
	set_signal <= not KEY(0);
    
    -- TODO: Instanciar o multiplicador
    -- Conecte:
    -- - clk => CLOCK_50
    -- - set => set_signal
    -- - a => SW(9 downto 5) (5 bits superiores)
    -- - b => SW(4 downto 0) (5 bits inferiores)
    -- - r => r
    --
    -- Não esqueça de passar o generic N=5:
    -- mult_inst: entity work.multiplier
    --     generic map (N => 5)
    --     port map ( ...
	mult_inst: entity work.multiplier
		generic map (N => 5)
		port map(
			clk => CLOCK_50,
			set => set_signal,
			a => SW(9 downto 5), -- (5 bits superiores)
			b => SW(4 downto 0), -- (5 bits inferiores)
			r => r
		);
		
    -- Prepare sinais para displays (adiciona zeros à esquerda)
	num_1_display <= "000" & SW(9 downto 5);
	num_2_display <= "000" & SW(4 downto 0);
    
    -- TODO: Instanciar 6 componentes bin2hex para mostrar:
    -- HEX5, HEX4: valor de A (num_1_display)
    -- HEX3, HEX2: valor de B (num_2_display)  
    -- HEX1, HEX0: resultado (r)
    
    -- Exemplo de como instanciar um:
    -- display0: entity work.bin2hex
    --     port map (
    --         BIN => r(3 downto 0),    -- 4 bits menos significativos
    --         HEX => HEX0
    --     );
	 
	display0: entity work.bin2hex
		port map (
			BIN => r(3 downto 0),    -- 4 bits menos significativos
			HEX => HEX0
		);
	
	display1: entity work.bin2hex
		port map (
			BIN => r(7 downto 4),    -- bits de 4 a 7
			HEX => HEX1
		);
	
	display2: entity work.bin2hex
		port map (
			BIN => r(11 downto 8),    -- bits de 8 a 11
			HEX => HEX2
		);
   
	display3: entity work.bin2hex
		port map (
			BIN => r(15 downto 12),    -- bits de 12 a 15
			HEX => HEX3
		);
	
	display4: entity work.bin2hex
		port map (
			BIN => r(19 downto 16),    -- bits de 15 a 19
			HEX => HEX4
		);
	
	display5: entity work.bin2hex
		port map (
			BIN => r(23 downto 20),    -- 4 bits mais significativos
			HEX => HEX6
		);
		
	 
	 -- Você precisa criar as outras 5 instâncias!

end Behavioral;
