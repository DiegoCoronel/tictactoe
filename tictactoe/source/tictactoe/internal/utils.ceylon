import tictactoe { Choice }
	
"Como isso poderia ser melhorado usando os recursos do ceylon ?"
[Position, Position, Position] makeNewLine(Board board, Choice choice, Position availability) {
	assert( exists currentLine = board[choice.line] );
	[Position, Position, Position ] newColumns;
		
	if( choice.column == 0 ) {
		newColumns = [ availability, currentLine[1], currentLine[2] ];
	} else if( choice.column == 1 ) {
		newColumns = [ currentLine[0], availability, currentLine[2] ];
	} else {
		newColumns = [ currentLine[0], currentLine[1], availability ];
	}
	return newColumns;
}

"Como isso poderia ser melhorado usando os recursos do ceylon ?"	
Board makeNewBoard(Board board, Choice choice, [Position, Position, Position] newLine) {
	variable value newBoard = board;
	if( choice.line == 0 ) {
		newBoard = [newLine, board[1], board[2]];
	} else if( choice.line == 1 ) {
		newBoard = [board[0], newLine, board[2]];
	} else {
		newBoard = [board[0], board[1], newLine];
	}
	return newBoard;
}