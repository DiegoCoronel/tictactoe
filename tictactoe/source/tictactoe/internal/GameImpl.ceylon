import tictactoe { Choice, unavailableBy_X, unavailableBy_O, Game, Status, running, Availability, draw, wonBy_O, wonBy_X }

"Implementation of Game Rules defined by [[Game]]"
shared class GameImpl( matrix = Matrix() ) satisfies Game {
	
	Matrix matrix;
	variable Status status = running;
	
	shared actual Boolean isAvailable(Choice choice) {
		return matrix.isAvailable( choice );
	}
	
	shared actual [Choice*] getAvailables() { 
		return matrix.getAvailables(); 
	}
	
	shared actual void markAs_X( Choice choice ) {
		mark( choice, unavailableBy_X );
	}
	
	shared actual void markAs_O( Choice choice ) {
		mark( choice, unavailableBy_O );
	}

	void mark(Choice choice, Availability player) {
	    "Apenas escolhas disponíveis são aceitas. E mesmo assim se o jogo estiver me andamento."
		assert( isAvailable(choice), status == running );
		
		matrix.mark(choice, player);
        
        updateStatus(player);
	}

	void updateStatus( Availability lastPlayed ) {
		for( line in getVictoryRules() ) {
			if( {Position(lastPlayed)}.containsEvery(line) ) {
				status = lastPlayed == unavailableBy_O then wonBy_O else wonBy_X;
				break;
			}
		} else {
			//Quando não cair no break do for entra neste else
			if( is Empty availables = getAvailables() ) {
				status = draw;
			}		
		}
	}

	shared actual Status getStatus() => status;

	"Regras do jogo"
	[[Position, Position, Position]*] getVictoryRules() {
		Board board = matrix.getBoard();
		
		return [
			//Horizontal
			board[0], board[1], board[2],

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