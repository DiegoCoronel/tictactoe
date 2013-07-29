"Representa uma escolha no tabuleiro"
shared class Choice(column, line) {
	shared Integer column;
	shared Integer line;
	
	assert( 0 <= column <= 2 );
	assert( 0 <= line <= 2 );
}
