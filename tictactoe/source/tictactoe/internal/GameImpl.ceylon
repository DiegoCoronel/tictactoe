import tictactoe { Choice, unavailableBy_X, unavailableBy_O, Game, Status, running, Availability, draw, wonBy_O, wonBy_X }

"Implementation of Game Rules defined by [[Game]]"
shared class GameImpl( matrix = Matrix() ) satisfies Game {
	
	"A matrix representa o tabuleiro do jogo"
	Matrix matrix;

	"Todo jogo começa com estado 'running' que deve ser modificado
	 para os demais estados conforme as regras de vitória ou empate.
	 Após ser modificado o estado o jogo não pode mais ser manipulado."
	variable Status status_ = running;

	shared actual Boolean available(Choice choice) {
		return matrix.isAvailable( choice );
	}
	
	shared actual [Choice*] availables() { 
		return matrix.getAvailables(); 
	}
	
	shared actual void markAs_X( Choice choice ) {
		mark( choice, unavailableBy_X );
	}
	
	shared actual void markAs_O( Choice choice ) {
		mark( choice, unavailableBy_O );
	}

	"Marca no tabuleiro a escolha do jogado se a mesma estiver disponível"
	void mark(Choice choice, Availability player) {
	    "Apenas escolhas disponíveis são aceitas. E mesmo assim se o jogo estiver me andamento."
		assert( available(choice), status == running );
		
		matrix.mark(choice, player);
        
        updateStatus(player);
	}

	"Atualiza estado do jogando checando a cada jogada se o mesmo chegou ao fim"
	void updateStatus( Availability lastPlayed ) {
		for( line in getVictoryRules() ) {
			if( {Ref(lastPlayed)}.containsEvery(line) ) {
				status_ = lastPlayed == unavailableBy_O then wonBy_O else wonBy_X;
				break;
			}
		} else {
			//Quando não cair no break do for entra neste else
			if( is Empty availables = availables() ) {
				status_ = draw;
			}		
		}
	}

	shared actual Status status() => status_;

	"Regras do jogo, determina as condições de vitória"
	[[Ref, Ref, Ref]*] getVictoryRules() {
		Board board = matrix.getBoard();
		
		return [
			//Horizontal
			board[0], 
			board[1], 
			board[2],

			//Vertical
			[board[0][0], board[1][0], board[2][0]],
			[board[0][1], board[1][1], board[2][1]],
			[board[0][2], board[1][2], board[2][2]],

			//Diagonal
			[board[0][0], board[1][1], board[2][2]],
			[board[2][0], board[1][1], board[0][2]]
		];
	}
}