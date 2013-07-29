import tictactoe { Availability, available, Choice }

"Representação do tabuleiro"
shared alias Board => [
	[Availability, Availability, Availability],
	[Availability, Availability, Availability],
	[Availability, Availability, Availability]
];

"Representa o tabuleiro inicial"
Board newBoard = [	[available, available, available], 
					[available, available, available],
					[available, available, available]];

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
		value newLine = makeNewLine(board, choice, availability);
		board = makeNewBoard(board, choice, newLine);
	}
	
	"Retorna verdadeiro caso a posição solicitada esteja como _available_"
	shared Boolean isAvailable(Choice choice) { 
		if( exists currentLine = board[choice.line], exists currentColumn = currentLine[choice.column],
		    currentColumn == available ) {
			 return true;
		}

		return false;
	}
	
	"Retorna todas as escolhas disponíveis"
	shared [Choice*] getAvailables() {
		return [
			for( i in 0..2 ) 
				for( j in 0..2 )
					if( exists line = board[i], exists column = line[j], column == available)
						Choice(j,i)
		];
	}
}
