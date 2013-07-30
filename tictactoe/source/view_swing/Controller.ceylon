import view_swing.view { OnClickListener, View }
import tictactoe { newGame, Game, Choice, running, wonBy_O, wonBy_X, draw }
import javax.swing { JOptionPane }

"Intermedio entre a view e as regras de negócio"
shared object controller satisfies OnClickListener {

	Game game = newGame();
	variable value count = 0;
	shared late View view;
	
	shared actual void onClick(Integer line, Integer column) {
		if( count % 2 == 0 ) {
			game.markAs_X(Choice(line, column));
			view.setUserChoice(line, column, "X");
		} else {
			game.markAs_O(Choice(line, column));
			view.setUserChoice(line, column, "O");
		}
		count++;
		
		checkEndGame();
	}
	
	void checkEndGame() {
		switch(game.getStatus())
		case( running ) {}
		case( wonBy_O ) {
			JOptionPane().showMessageDialog(null, "Jogo vencido por 'O' ");
			process.exit(0);
		}
		case( wonBy_X ) {
			JOptionPane().showMessageDialog(null, "Jogo vencido por 'X' ");
			process.exit(0);
		}
		case( draw ) {
			JOptionPane().showMessageDialog(null, "Jogo empatado");
			process.exit(0);
		} 
	}

}