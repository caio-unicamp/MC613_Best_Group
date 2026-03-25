Simulação:
  - todos os produtos e se o valor correto é retornado
  - colocar dinheiro sem pressionar avançar/antes da seleção do produto
  - troca de produtos antes de apertar pra avançar
  - testar o fluxo alternativo esperado de cancelamento

  - notas ao mesmo tempo
  - avançar sem nota alguma
  - continuar colocando dinheiro depois de cancelar
  - continuar colocando depois de liberar o produto

  - colocar dinheiro a mais para conferir o troco correto
  - colocar mais quantidade de dinheiro do que o suportado
  - colocar o dinheiro exato e conferir o fluxo de não-troco
  - testar o cancelamento depois das etapas de liberação

Placa:
- Os LED's estão acendendo nas situações corretas (troco, devolução e dispensa de produto)
  - Caso em que troco = 0 (LEDR0)
  - Caso em que troco > 0 (LEDR0 e LEDR1)
  - Caso de cancelamento com saldo atual = 0 (Nenhum LED)
  - Caso de cancelamento com saldo atual > 0 (LEDR1)
- Os displays HEX estão exibindo como esperado o código do produto, o valor restante a ser pago (e suas atualizações) e o valor de troco/devolução
- Os switchs estão bindados corretamente (quais switchs são para selecionar o produto e quais são para inserir dinheiro) (esquerda para direita)
- Verificar se o período de aguardo de 1 segundo está sendo triggered nas situações corretas
  - Caso em que troco = 0
  - Caso em que troco > 0
  - Caso de cancelamento com saldo atual > 0
- Verificar se o período de aguardo de 1 segundo realmente está levando 1 segundo
- Verificar se os botões de Avançar e Cancelar estão bindados corretamente e se não estão sendo registrados várias vezes
- Iniciar o programa com switches levantados
- Abaixar/levantar switches de seleção de produto durante o estado de inserir dinheiro
