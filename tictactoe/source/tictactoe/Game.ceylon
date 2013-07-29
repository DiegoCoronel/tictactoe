import tictactoe.internal { Matrix }
"Responsável pelas regras do jogo, utilizada para interação com as regras do jogo, tais como:
 
 * Checar se um ponto encontra-se disponível
 * Checar se o jogo chegou ao fim
 * Informar quem venceu ou se houve empate
 * Marcar um ponto especifico para um jogador
 "
by("Diego Coronel")
shared class Game( matrix = Matrix() ) {
	
	Matrix matrix;
	
	"Verifica se a escolha encontra-se disponível"
	shared Boolean isAvailable(Choice choice) {
		return matrix.isAvailable( choice );
	}
	
	shared [Choice*] getAvailables() { 
		return matrix.getAvailables(); 
	}
	
	shared void markAs_X( Choice choice ) {
		"Apenas escolhas disponíveis são aceitas."
		assert( isAvailable(choice) );
				matrix.mark(choice, unavailableBy_X);
	}
	
	shared void markAs_O( Choice choice ) {
		"Apenas escolhas disponíveis são aceitas."
		assert( isAvailable(choice) );
		
		matrix.mark(choice, unavailableBy_O);
	}
}

"Determina a disponibilidade de uma posicao"
shared interface Availability of available | unavailableBy_O | unavailableBy_X {}

"Posição encontra-se disponivel"
shared object available satisfies Availability{}

"Posição encontra-se indisponivel por _O_"
shared object unavailableBy_O satisfies Availability{}

"Posição encontra-se indisponivel por _X_"
shared object unavailableBy_X satisfies Availability{}