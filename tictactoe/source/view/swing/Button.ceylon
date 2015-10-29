import javax.swing { JButton }
import java.awt { Font { plain = \iPLAIN} }

shared class Button(line, column) extends JButton() {
	
	shared Integer line;
	shared Integer column;

		
	shared void withCustomFont() {
		this.font = Font("Arial", plain, 48);
	}

}
