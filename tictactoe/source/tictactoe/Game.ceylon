import tictactoe.internal { GameImpl }
"Responsável pelas regras do jogo, utilizada para interação com as regras do jogo, tais como:
 
 * Checar se uma escolha encontra-se disponível
 * Checar se o jogo chegou ao fim
 * Informar quem venceu ou se houve empate
 * Marcar uma escolha específica para um jogador
 "
by("Diego Coronel")
shared interface Game {
	
	"Verifica se a escolha encontra-se disponível"
	shared formal Boolean isAvailable(Choice choice);
	
	"Recuperar todas as posições que ainda estão disponíveis"
	shared formal [Choice*] getAvailables();
	
	"Marca uma posição para o jogado _X_"
	shared formal void markAs_X( Choice choice );
	
	"Marca uma posição para o jogado _O_"
	shared formal void markAs_O( Choice choice );

    "Retorna o estado corrente do jogo"
	shared formal Status getStatus();
}

"Retorna uma instância para um novo jogo"
shared Game newGame() {
	return GameImpl();
}


"Retorna o Estado atual do jogo"
shared interface Status of draw | wonBy_O | wonBy_X | running{}

"Informa se o jogo terminou empatado"
shared object draw satisfies Status{}

"Informa se o jogador _O_ foi o vencedor"
shared object wonBy_O satisfies Status{}

"Informa se o jogador _X_ foi o vencedor"
shared object wonBy_X satisfies Status{}

"Informa se jogo continua em andamento"
shared object running satisfies Status{}


"Determina a disponibilidade de uma posicao"
shared interface Availability of available | unavailableBy_O | unavailableBy_X {}

"Posição encontra-se disponivel"
shared object available satisfies Availability{}

"Posição encontra-se indisponivel por _O_"
shared object unavailableBy_O satisfies Availability{}

"Posição encontra-se indisponivel por _X_"
shared object unavailableBy_X satisfies Availability{}