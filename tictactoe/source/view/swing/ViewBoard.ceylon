import javax.swing { JFrame { exitOnClose = \iEXIT_ON_CLOSE }, JOptionPane }
import tictactoe { Choice }
import java.awt { GridLayout, Dimension, Toolkit { defaultToolkit = defaultToolkit} }
import ceylon.collection { LinkedList,
	MutableList }
import view { View }

"Implementação da view"
shared class ViewBoard() extends JFrame("TicTacToe") satisfies View {

	MutableList<Button> buttons = LinkedList<Button>(); 

	shared void setOnClickListener(Anything onClick(Choice choice)) {
		setSize(300, 300);
		contentPane.layout = GridLayout(3, 2);
		
		for( i in 0..2 ) {
			for( j in 0..2 ) {
				Button button = Button(i, j);
				button.withCustomFont();
				
				button.addActionListener(ChoiceListener(button, onClick));
				contentPane.add(button);
				buttons.add(button);
			}	
		}
		
		setVisible(true);
		centerWindow();
		defaultCloseOperation = exitOnClose;
	}

	void centerWindow() {
		Dimension dimension = defaultToolkit.screenSize;
    	Float x = ((dimension.width - width) / 2);
    	Float y = ((dimension.height - height) / 2);
    	setLocation(x.integer, y.integer);
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