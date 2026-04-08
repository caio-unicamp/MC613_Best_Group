# Simulação
1. VGA, PPU E PLL
- testar o clock do PLL 
- verifica reset de pos_x e pos_y
- validar sinconização da VGA
- verificar os pixels fora da tela (video_on)
- Mostra tela preta
- Mostrar listras (sla, x%20 == 0)
- Mostrar tiles específicos
- Mostrar background inteiro
- Mostrar a bola em um lugar específico (testar prioridade)
- Mover o sprite da bola pra outro lugar

2. Game Control
- sinais dos "botoes" movem as barras
- bola "andando"
- barra limitada às paredes
- bola colidindo com parede
- score alterando com colisão
- score resetando no estado reset jogo
- bola colidindo com barra
- posição barra resetando com reset jogo
- posição bola resetando a cada gol

# Placa
1. VGA, PPU E PLL
- Mostra tela preta
- Mostrar listras (sla, x%20 == 0)
- Mostrar background inteiro
- Mostrar a bola em um lugar específico (testar prioridade)
- Mover o sprite da bola pra outro lugar

2. Game Control
- botoes movem as barras
- pressionar mais de um botão ao mesmo tempo
	- de duas pessoas diferentes (é pra considerar os dois)
	- da mesma pessoa (travar o movimento)
- colisões
- jogar o jogo
- reset da placa
- exibir score corretamente
- LEDs da placa para mapear sinais internos como v_sync ou h_sync. (piscar led ou ficar asceso)
