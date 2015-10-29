import java.awt.event { ActionEvent, ActionListener }
import tictactoe { Choice }

shared class ChoiceListener(button, onClick) satisfies ActionListener {

	Button button;
	Anything onClick(Choice choice);
	
	shared actual void actionPerformed(ActionEvent e) {
		onClick(Choice(button.line, button.column));
	}
	
}
