"Representa uma escolha no tabuleiro"
shared class Choice(line, column) {
	shared Integer column;
	shared Integer line;
	
	assert( 0 <= column <= 2 );
	assert( 0 <= line <= 2 );

	"Duas escolhas são consideradas iguais se a linha e a coluna for a mesma"
	shared actual Boolean equals( Object other ) {
		if( is Choice other ) {
			return other.line == line && other.column == column;
		}
		return false;
	}

	shared actual String string {
		return "Choice[``line``, ``column``]";
	}
}
