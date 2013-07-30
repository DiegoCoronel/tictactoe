package view_swing.view.impl;

import java.awt.Container;
import java.awt.GridLayout;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JFrame;

import view_swing.view.OnClickListener;
import view_swing.view.View;

public class ViewBoard extends JFrame implements View {
	private static final long serialVersionUID = 1L;
	
	private List<Button> buttons = new ArrayList<>();
	
	public ViewBoard() {
		super("TicTacToe - Almost in Ceylon way");
		setSize(300, 300);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
	}
	
	public void makeBoard( OnClickListener event ) {
		Container contentPane = getContentPane();
		contentPane.setLayout( new GridLayout(3, 2) );
		
		for( int i = 0; i <= 2; i++) {
			for( int j = 0; j <= 2; j++) {
				Button button = new Button(i, j);
				button.addActionListener(new ChoiceListener(button, event));
				contentPane.add(button);
				buttons.add(button);
			}	
		}
	}

	@Override
	public void setUserChoice(int line, int column, String text) {
		for( Button button : buttons) {
			if( button.getLine() == line && button.getColumn() == column) {
				button.setText(text);
				button.setEnabled(false);
			}
		}
	}
	
}
