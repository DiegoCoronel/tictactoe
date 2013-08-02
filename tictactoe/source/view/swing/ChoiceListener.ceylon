import java.awt.event { ActionEvent, ActionListener }
import tictactoe { Choice }
import view { OnClickListener }

shared class ChoiceListener(button, event) satisfies ActionListener {

	Button button;
	OnClickListener event;
	
	shared actual void actionPerformed(ActionEvent e) {
		event.onClick(Choice(button.line, button.column));
	}
	
	
}
