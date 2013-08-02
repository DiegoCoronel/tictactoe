import tictactoe { Choice }

shared interface View {
	shared formal void setUserChoice( Choice choice, String text );
	shared formal void showMessage( String message );
}