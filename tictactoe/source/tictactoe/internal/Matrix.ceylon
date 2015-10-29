import tictactoe { Availability, available, Choice }

"Tuplas são imutaveis, entao a melhor forma é alterar o valor interno de uma classe"
shared class Ref(availability = available) {

    shared variable Availability availability;

    shared actual Boolean equals( Object other ) {
        if( is Ref other ) {
            return availability == other.availability;
        }
        return false;
    }

}

"Representação do tabuleiro"
shared alias Board => [
	[Ref, Ref, Ref],
	[Ref, Ref, Ref],
	[Ref, Ref, Ref]
];

"Representa o tabuleiro inicial"
Board newBoard = [	[Ref(), Ref(), Ref()], 
					[Ref(), Ref(), Ref()],
					[Ref(), Ref(), Ref()]];

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
		assert(exists line = board[choice.line]);
        assert(exists element = line.get(choice.column));
		element.availability = availability;
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
		board.each(void (Ref[3]|Ref[3]|Ref[3] colunms) {
			colunms.each(void (Ref element) {
				
			});
		});
		
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
