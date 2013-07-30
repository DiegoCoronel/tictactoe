import view_swing.view.impl { ViewBoard }

 "Run the module `view_swing`."
void run() {

	value view = ViewBoard();
	view.makeBoard(controller);
	view.setVisible(true);
	
	controller.view = view;
}