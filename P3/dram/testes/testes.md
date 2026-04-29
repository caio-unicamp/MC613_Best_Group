# Plano de Simulações:

- dram_iface:
	- correto e coerente funcinamento dos estados criados para o módulo (transição correta, permanência correta)
	- tratamento e repasse correto das entradas do usuário para o módulo do controlador
	- exibição das saídas nos locais referentes a saída na placa

- dram_controller:
	- teste dos comandos e como estão se comportando durante o fluxo esperado (acivate, read, write, precharge, refresh)
	- temporizadores para os estados realizando a espera correta
	- inspeção de conflito entre as entradas recebidas as execuções referentes ao estado atual
	- consistência e coerência nas mudanças dos estados esperados e auxiliares (corretude e respeito aos tempos estipulados de transição entre cada estado)
	- corretude da sequência de inicialização
	- priorização do estado de refresh em relação aos demais
	
	