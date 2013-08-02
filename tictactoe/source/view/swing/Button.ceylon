import javax.swing { JButton }
import java.awt { Font { plain = \iPLAIN} }

shared class Button(line, column) extends JButton() {
	
	shared Integer line;
	shared Integer column;

		
	shared void withCustomFont() {
		Font fontCustomized = Font("Arial", plain, 48);
		this.font = fontCustomized;
	}

}
