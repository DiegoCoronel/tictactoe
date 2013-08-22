import ceylon.test { assertEquals, fail, assertTrue }
import tictactoe { Game, Choice, available, unavailableBy_O, unavailableBy_X, wonBy_X, wonBy_O, newGame, draw }
import tictactoe.internal { Matrix, GameImpl, Ref }

void testPositionAvailable() {
	"   _ _ _
		_ _ _
		_ _ _
	"
	Matrix matrix = Matrix();

	//Com a implementacao do conceito de _friend_ somente o modulo de teste vai ter acesso a esta implementacao.
	Game game = GameImpl( matrix );
	
	value choice = Choice { 
		column = 0; 
		line = 0; 
	};
	
	assertEquals(true, game.isAvailable( choice ));
}

void testPositionUnavailable() {
	value matrix=makeMatrix2();

	//Com a implementacao do conceito de _friend_ somente o modulo de teste vai ter acesso a esta implementacao.
	Game game = GameImpl( matrix );
	
	value choice = Choice { 
		column = 1; 
		line = 0; 
	};
	
	assertEquals(false, game.isAvailable( choice ));
}

void testNoAvailables() {

	value matrix=makeMatrix3();

	//Com a implementacao do conceito de _friend_ somente o modulo de teste vai ter acesso a esta implementacao.
	Game game = GameImpl( matrix );
	assertEquals(empty, game.getAvailables());
}

void testMatrix2Availables() {
	value matrix=makeMatrix2();

	//Com a implementacao do conceito de _friend_ somente o modulo de teste vai ter acesso a esta implementacao.
	Game game = GameImpl( matrix );
	value availables = [Choice(0,2), Choice(1,0), Choice(1,1), Choice(2,1)] ;
	assertEquals(availables, game.getAvailables());
}

void testPlayerXWon() {
	value matrix=makeMatrix2();

	//Com a implementacao do conceito de _friend_ somente o modulo de teste vai ter acesso a esta implementacao.
	Game game = GameImpl( matrix );

	game.markAs_X(Choice(0,2));

	assertEquals(wonBy_X, game.getStatus());
}

void testPlayerOWon() {
	value matrix=makeMatrix2();

	//Com a implementacao do conceito de _friend_ somente o modulo de teste vai ter acesso a esta implementacao.
	Game game = GameImpl( matrix );

	game.markAs_O(Choice(0,2));

	assertEquals(wonBy_O, game.getStatus());
}

"Bug encontrado enquanto tentava fazer a tela em Swing"
void testMarkFull() {
	"  X X 0
	   0 0 X
	   X 0 X
	"
	Game game = newGame();
	game.markAs_X(Choice(0,0));
	game.markAs_O(Choice(1,0));
	game.markAs_X(Choice(2,0));
	game.markAs_O(Choice(1,1));
	game.markAs_X(Choice(0,1));
	game.markAs_O(Choice(2,1));
	game.markAs_X(Choice(1,2));
	game.markAs_O(Choice(0,2));
	game.markAs_X(Choice(2,2));

	assertEquals(draw, game.getStatus());
}

void testMarkSamePosition() {
	"   0 0 _
		_ _ X
		0 _ X
	"
	Matrix matrix = makeMatrix2();

	Game game = GameImpl(matrix);

	try {
		game.markAs_O(Choice(0,0));
		fail("Não deve permitir escolher uma opção indisponível");
	} catch( AssertionException e ) {
		assertTrue(true);
	}

}

Matrix makeMatrix2() {
	"   0 0 _
		_ _ X
		0 _ X
	"
	Matrix matrix = Matrix( [
			[Ref(unavailableBy_O), Ref(unavailableBy_O),Ref(available)],
			[Ref(available), 	  Ref(available), 		Ref(unavailableBy_X)],
			[Ref(unavailableBy_O), Ref(available), 		Ref(unavailableBy_X)]
	]);
	return matrix;
}

Matrix makeMatrix3() {
	"  X X 0
	   0 0 X
	   X 0 X
	"
	Matrix matrix = Matrix([
		[Ref(unavailableBy_X), Ref(unavailableBy_X), 	Ref(unavailableBy_O)],
		[Ref(unavailableBy_O), Ref(unavailableBy_O), 	Ref(unavailableBy_X)],
		[Ref(unavailableBy_X), Ref(unavailableBy_O), 	Ref(unavailableBy_X)]
	]);
	return matrix;
}
