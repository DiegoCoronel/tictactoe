import tictactoe { newGame, Game, Choice, running, wonBy_O, wonBy_X, draw }
import view { OnClickListener, View }

"Intermedio entre a view e as regras de negócio
 Este controlador é feito apenas para rodar o jogo uma única vez."
 by("Diego Coronel")
shared object controller satisfies OnClickListener {

	Game game = newGame();

	"Maneira preguiçosa de alternar os jogadores"
	variable value count = 0;

	shared late View view;
	
	shared actual void onClick(Choice choice) {
		if( count % 2 == 0 ) {
			game.markAs_X(choice);
			view.setUserChoice(choice, "X");
		} else {
			game.markAs_O(choice);
			view.setUserChoice(choice, "O");
		}
		count++;
		
		checkEndGame();
	}
	
	void checkEndGame() {
		switch(game.getStatus())
		case( running ) {}
		case( wonBy_O ) {
			view.showMessage( "Jogo vencido por 'O' " );
			process.exit(0);
		}
		case( wonBy_X ) {
			view.showMessage( "Jogo vencido por 'X' " );
			process.exit(0);
		}
		case( draw ) {
			view.showMessage( "Jogo empatado" );
			process.exit(0);
		} 
	}

}