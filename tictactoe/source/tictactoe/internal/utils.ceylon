import tictactoe { Choice, Availability }
	
"Como isso poderia ser melhorado usando os recursos do ceylon ?"
[Availability, Availability, Availability] makeNewLine(Board board, Choice choice, Availability availability) {
	assert( exists currentLine = board[choice.line] );
	[Availability, Availability, Availability ] newColumns;
		
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
Board makeNewBoard(Board board, Choice choice, [Availability, Availability, Availability] newLine) {
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