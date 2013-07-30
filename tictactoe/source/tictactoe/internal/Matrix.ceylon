import tictactoe { Availability, available, Choice }

"Acredito que seja um bug no Ceylon, mas não consegui representar os tipos da tupla com uma interface"
shared class Position( availability ) {

	"Mantem a informação de ocupação de uma posição"
	shared Availability availability; 

	"São iguais se forem ocupados pelo mesmo contrato [[Availability]]"
	shared actual Boolean equals( Object other ) {
		if( is Position other ) {
			return other.availability == availability;
		}
		return false;
	}
}

"Representação do tabuleiro"
shared alias Board => [
	[Position, Position, Position],
	[Position, Position, Position],
	[Position, Position, Position]
];

"Representa o tabuleiro inicial"
Board newBoard = [	[Position(available), Position(available), Position(available)], 
					[Position(available), Position(available), Position(available)],
					[Position(available), Position(available), Position(available)]];

"Representa o tabuleiro do jogo com suas devidas marcações.
 
 Principais responsabilidade:
 * Representar o tabuleiro do jogo TicTacToe
 * Apenas manter as marcações de: disponivel, indisponivel pelo jogardor X e indisponivel pelo jogador O
 * Informar a disponibilidade de uma posição
 * Informar todos as posições disponíveis
 
 "
shared class Matrix(board = newBoard ) {
	
	variable Board board;
	
	"Marca uma opção que com a disponibilidade especificada"
	shared void mark(Choice choice, Availability availability) {
		value newLine = makeNewLine(board, choice, Position(availability));
		board = makeNewBoard(board, choice, newLine);
	}
	
	"Retorna verdadeiro caso a posição solicitada esteja como _available_"
	shared Boolean isAvailable(Choice choice) { 
		if( exists currentLine = board[choice.line], exists currentColumn = currentLine[choice.column],
		    currentColumn.availability == available ) {
			 return true;
		}

		return false;
	}
	
	"Retorna todas as escolhas disponíveis"
	shared [Choice*] getAvailables() {
		return [
			for( i in 0..2 ) 
				for( j in 0..2 )
					if( exists line = board[i], exists column = line[j], column.availability == available)
						Choice(i,j)
		];
	}

	"Retorna o tabuleiro atual do jogo"
    shared Board getBoard() {
		return board;
	}

}
