package view_swing.view.impl;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import view_swing.view.OnClickListener;
import view_swing.view.impl.Button;


public class ChoiceListener implements ActionListener {

	private Button button;
	private OnClickListener event;
	
	public ChoiceListener(Button button, OnClickListener event) {
		this.button = button;
		this.event = event;
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		event.onClick(button.getLine(), button.getColumn());
	}
	
	
}
