library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity maquina_estados is
    Port (
        clk              : in  STD_LOGIC;
        rst              : in  STD_LOGIC;
        -- Botões assíncronos
        avancar          : in  STD_LOGIC;
        cancelar         : in  STD_LOGIC;
        -- Entradas do módulo do acumulador
        valor_acumulado  : in  STD_LOGIC_VECTOR(10 downto 0);
        saldo_suficiente : in  STD_LOGIC_VECTOR(10 downto 0);
        troco            : in  STD_LOGIC_VECTOR(10 downto 0);
        -- Sinais do contador
        done_timer       : in STD_LOGIC;    -- Recebido pelo contador de 1s quando ele encerra
        reset_timer      : out STD_LOGIC;    -- Envia para o contador quando ele deve recomeçar a contar
        estado_atual     : out STD_LOGIC_VECTOR(2 downto 0);
        clr_acumula      : out STD_LOGIC
    );
end maquina_estados;

architecture Behavioral of maquina_estados is

    type estado_tipo is (escolher_produto, inserir_dinheiro, dispensar, devolver_normal, devolver_troco);
    estado_atual, estado_proximo : estado_tipo;

begin

    -- Registrador de estado
    process(clk, rst)
    begin
        if rst = '1' then
            estado_atual <= escolher_produto;
        elsif rising_edge(clk) then
            estado_atual <= estado_proximo;
        end if;

        when dispensar =>
            if (troco) = '0' then
                estado_proximo <= escolher_produto;
            else
                estado_proximo <= devolver_troco;
            end if;

        when devolver_troco =>
        
    end process;

    -- Lógica de transição de estados
    process(estado_atual, avancar, cancelar)
    begin
        case estado_atual is

            when escolher_produto =>
                if confirmar = '1' then
                    estado_proximo <= inserir_dinheiro;
                else
                    estado_proximo <= escolher_produto;
                end if;

            when inserir_dinheiro =>
                if cancelar = '1' then
                    if (valor_acumulado) = '0' then
                        estado_proximo <= escolher_produto;
                    else
                        estado_proximo <= devolver_normal;
                    end if;
                elsif avancar = '1' then
                    clr_acumula <= '1';
                else
                    estado_proximo <= inserir_dinheiro;
                end if;

            when devolver_normal =>    -- Precisa dividir em devolver normal e devolver troco
                estado_proximo <= escolher_produto;


        end case;
    end process;

end Behavioral;