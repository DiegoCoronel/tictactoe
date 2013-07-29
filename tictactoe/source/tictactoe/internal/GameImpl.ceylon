import tictactoe { Choice, unavailableBy_X, unavailableBy_O, Game }

"Implementation of Game Rules defined by [[Game]]"
shared class GameImpl( matrix = Matrix() ) satisfies Game {
	
	Matrix matrix;
	
	shared actual Boolean isAvailable(Choice choice) {
		return matrix.isAvailable( choice );
	}
	
	shared actual [Choice*] getAvailables() { 
		return matrix.getAvailables(); 
	}
	
	shared actual void markAs_X( Choice choice ) {
		"Apenas escolhas disponíveis são aceitas."
		assert( isAvailable(choice) );
		
		matrix.mark(choice, unavailableBy_X);
	}
	
	shared actual void markAs_O( Choice choice ) {
		"Apenas escolhas disponíveis são aceitas."
		assert( isAvailable(choice) );
		
		matrix.mark(choice, unavailableBy_O);
	}
}