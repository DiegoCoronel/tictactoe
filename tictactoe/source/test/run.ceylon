import ceylon.test { assertEquals }
import tictactoe { Game, Choice, available }
import tictactoe.internal { Matrix }
" 
 Matrix 1:
			_ _ _
			_ _ _
			_ _ _
"
Matrix matrix1 = Matrix();

" 
 Matrix 2:
			0 0 _
			_ _ X
			0 _ X
"
Matrix matrix2 = Matrix();

" 
 Matrix 2:
			X X 0
			0 0 X
			X 0 X
"
Matrix matrix3 = Matrix();


void testPositionAvailable() {
	Game game = Game( matrix1 );
	
	value choice = Choice { 
		column = 0; 
		line = 0; 
	};
	
	assertEquals(available, game.isAvailable( choice ));
}

void testPositionUnavailable() {
	Game game = Game( matrix2 );
	
	value choice = Choice { 
		column = 1; 
		line = 0; 
	};
	
	assertEquals(available, game.isAvailable( choice ));
}

void testNoAvailables() {
	Game game = Game( matrix3 );
	assertEquals(empty, game.getAvailables());
}

