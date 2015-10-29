import view.swing { ViewBoard }
import view.controller { controller }

"Run the module `view`."
shared void run() {
 
 	value view = ViewBoard();
 	view.setOnClickListener(controller.onClick);
 
 	controller.view = view;
    
}
