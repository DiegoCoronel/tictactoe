import javax.swing { JFrame { exitOnClose = \iEXIT_ON_CLOSE }, JOptionPane }
import tictactoe { Choice }
import java.awt { GridLayout }
import ceylon.collection { LinkedList }
import view { OnClickListener, View }

"Implementação da view"
shared class ViewBoard() extends JFrame("TicTacToe - Almost in Ceylon way") satisfies View {

	LinkedList<Button> buttons = LinkedList<Button>(); 

	shared void init(OnClickListener onClickListener) {
		setSize(300, 300);
		contentPane.layout = GridLayout(3, 2);
		
		for( i in 0..2 ) {
			for( j in 0..2 ) {
				Button button = Button(i, j);
				button.withCustomFont();
				
				button.addActionListener(ChoiceListener(button, onClickListener));
				contentPane.add(button);
				buttons.add(button);
			}	
		}
		
		setVisible(true);
		defaultCloseOperation = exitOnClose;
	}

	shared actual void showMessage( String message ) {
		JOptionPane().showMessageDialog(null, message);
	}

	shared actual void setUserChoice(Choice choice, String text) {
		Button? button = buttons.find((Button button) 
					=> button.line == choice.line && button.column == choice.column);
		
		assert( exists button );
		
		button.text = text;
		button.setEnabled(false);
	} 
	

}