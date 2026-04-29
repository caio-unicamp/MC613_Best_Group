# Plano de Simulações:
## dram_iface:
- correto e coerente funcionamento dos estados criados para o módulo (transição correta, permanência correta)
- tratamento e repasse correto das entradas do usuário para o módulo do controlador
- exibição das saídas nos locais referentes a saída na placa

## dram_controller:
- teste dos comandos e como estão se comportando durante o fluxo esperado (acivate, read, write, precharge, refresh)
- temporizadores para os estados realizando a espera correta
- inspeção de conflito entre as entradas recebidas as execuções referentes ao estado atual
- consistência e coerência nas mudanças dos estados esperados e auxiliares (corretude e respeito aos tempos estipulados de transição entre cada estado)
- corretude da sequência de inicialização
- priorização do estado de refresh em relação aos demais
	
	
# Teste Placa:
## dram_iface:
- valores aparecem corretamente no hex de acordo com os switches
- endereço aparece corretamente no hex de acordo com os switches
- ligar leds quando mandar comando de write e read
 
## top_level:
- gravar um valor em um endereço, gravar outro valor em outro endereço, voltar pro endereço original e ver se o valor está certo
- gravar valor no mesmo endereço mais de uma vez
- testar o reset
- testar mexer no switch e no botão ao mesmo tempo
- testar refresh
- escrever linhas e colunas diferentes
