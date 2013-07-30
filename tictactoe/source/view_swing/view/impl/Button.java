package view_swing.view.impl;

import javax.swing.JButton;

public class Button extends JButton {
	private static final long serialVersionUID = 1L;

	private int line;
	private int column;

	public Button( int line, int column ) {
		super("");
		this.line = line;
		this.column = column;
	}

	public int getLine() {
		return line;
	}

	public int getColumn() {
		return column;
	}
	
}