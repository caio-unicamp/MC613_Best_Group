library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity maquina_estados is
    Port (
        clk              : in  STD_LOGIC;
        -- Botões assíncronos
        avancar          : in  STD_LOGIC;
        cancelar         : in  STD_LOGIC;
        -- Entradas vindas da máquina acumuladora
        valor_acumulado  : in STD_LOGIC_VECTOR(10 downto 0);
        troco            : in STD_LOGIC_VECTOR(10 downto 0);
        venda_concluida  : in STD_LOGIC;
        -- Sinais do Timer
        done_timer       : in STD_LOGIC;    -- Recebido pelo contador de 1s (1 = acabou)
        reset_timer      : out STD_LOGIC;    -- Envia para o contador quando ele deve recomeçar a contar (1 zera/pause, 0 conta)
        -- Sinais de saída diversos
        estado_out       : out STD_LOGIC_VECTOR(2 downto 0);    -- Envia pra Mux_valor
        clr_acumula      : out STD_LOGIC    -- Zera o acumulador
    );
end maquina_estados;

architecture Behavioral of maquina_estados is

    type estado_tipo is (escolher_produto, inserir_dinheiro, dispensar, devolver_normal, devolver_troco);
    signal estado_atual, estado_proximo : estado_tipo;

begin

    -- Registrador de estado
    process(clk)
    begin
        if rising_edge(clk) then
            estado_atual <= estado_proximo;
        end if;


    end process;

    -- Lógica de transição de estados e saídas
    process(estado_atual, avancar, cancelar, troco, done_timer, valor_acumulado, venda_concluida)
    begin
        -- Valores padrão iniciais
        estado_proximo <= estado_atual; -- Por padrão, fica no mesmo estado
        clr_acumula    <= '0';
        reset_timer    <= '1';          -- Por padrão, o timer não deve ser iniciado

        case estado_atual is

            when escolher_produto =>
                if avancar = '1' then
                    estado_proximo <= inserir_dinheiro;
                else
                    estado_proximo <= escolher_produto;
                end if;

            when inserir_dinheiro =>    
                if cancelar = '1' then -- Caso cancele, confere se o valor acumulado é 0
                    if unsigned(valor_acumulado) = 0 then   -- Se for, volta ao estado de escolher produto
                        estado_proximo <= escolher_produto;
                    else    -- Caso contrário, vai para o estado de ressarcir o dinheiro inserido
                        estado_proximo <= devolver_normal;
                    end if;
                elsif venda_concluida = '1' then  -- Quando a venda foi concluída e o botão de avançar foi pressionado, indica que pode limpar o acumulador e passa para o estado de dispensar
                    estado_proximo <= dispensar;
                else
                    estado_proximo <= inserir_dinheiro;
                end if;

            when dispensar =>   
                reset_timer <= '0';  -- Reseta o cronômetro de 1s
                if done_timer = '1' then    -- Depois que passar 1s
                    if unsigned(troco) = 0 then
                        clr_acumula <= '1'; -- Zera o acumulador
                        estado_proximo <= escolher_produto; -- Finalmente volta para o estado inicial
                    else
                        estado_proximo <= devolver_troco;   -- Se houver troco deve seguir para esse estado
                    end if;
                end if;

            when devolver_troco =>
                reset_timer <= '0'; -- Reseta o cronômetro de 1s

                if done_timer = '1' then
                    clr_acumula <= '1'; -- Zera o acumulador
                    estado_proximo <= escolher_produto; -- Finalmente segue para o estado inicial após devolver todo o troco
                end if;
            when devolver_normal =>    
                reset_timer <= '0'; -- Reseta o cronômetro de 1s

                if done_timer = '1' then
                    clr_acumula <= '1'; -- Zera o acumulador
                    estado_proximo <= escolher_produto; -- Finalmente segue para o estado inicial após ressarcir o que foi inserido antes de cancelar a operação
                end if;
        end case;
    end process;

    -- Envia o estado atual para o multiplexador dos displays 
    process(estado_atual)
        begin
            case estado_atual is
                when escolher_produto => estado_out <= "000";
                when inserir_dinheiro => estado_out <= "001";
                when dispensar        => estado_out <= "010";
                when devolver_normal  => estado_out <= "011";
                when devolver_troco   => estado_out <= "100";
                when others           => estado_out <= "111";   -- Estado inalcançável
            end case;
        end process;
end Behavioral;