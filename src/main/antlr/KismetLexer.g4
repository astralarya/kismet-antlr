// Kismet Grammar

lexer grammar KismetLexer;

// Lexer

LBRACE : '{' ;
RBRACE : '}' ;
LBRACKET : '[' ;
RBRACKET : ']' ;
LPAREN : '(' ;
RPAREN : ')' ;
SEMICOLON : ';' ;
COMMA : ',' ;
ASSIGN : '=' ;
ELLIPSIS : '...' ;
DOT : '.' ;
PLUS : '+' ;
MINUS : '-' ;
TIMES : '*' ;
DIV : '/' ;
IDIV : '//' ;
MOD : '%' ;
GT : '>' ;
LT : '<' ;
GTE : '>=' | '≥' ;
LTE : '<=' | '≤' ;
EQ : '==' ;
NEQ : '!=' | '≠' ;
SS_AND : '&&' ;
SS_OR : '||' ;
POW : '^' ;
DIE : 'd' | 'D' ;

ROLL
  : DIE ('0' .. '9')+
  ;

TRUE : 'true' ;
FALSE : 'false' ;
NULL : 'null' ;
UNDEFINED : 'undefined' ;

AND : 'and' ;
OR : 'or' ;
XOR : 'xor' ;
NAND : 'nand' ;
NOT : 'not' ;

STRING
  : '"' DOUBLE_QUOTE_CHAR* '"'
  | '\'' SINGLE_QUOTE_CHAR* '\''
  ;

fragment DOUBLE_QUOTE_CHAR
  : ~["\\\r\n]
  | ESCAPE_SEQUENCE
  ;

fragment SINGLE_QUOTE_CHAR
  : ~['\\\r\n]
  | ESCAPE_SEQUENCE
  ;

fragment ESCAPE_SEQUENCE
  : '\\' ~[\r\n]
  ;

ID
  : ID_START ID_CHAR*
  ;

fragment ID_START
  : [a-zA-Z_]
  ;

fragment ID_CHAR
  : ID_START | [0-9]
  ;

DECIMAL
  : DECIMAL_START DECIMAL_CHAR*
  ;

fragment DECIMAL_START
  : [0-9]
  ;

fragment DECIMAL_CHAR
  : DECIMAL_START | '_'
  ;

HEXADECIMAL
  : HEXADECIMAL_START HEXADECIMAL_CHAR+
  ;

fragment HEXADECIMAL_START
  : '0x'
  | '0X'
  ;

fragment HEXADECIMAL_CHAR
  : [0-9a-fA-F] | '_'
  ;

BINARY
  : BINARY_START BINARY_CHAR+
  ;

fragment BINARY_START
  : '0b'
  | '0B'
  ;

fragment BINARY_CHAR
  : [01_]
  ;

FLOAT
  : FLOAT_PART (('e' | 'E') SIGN? FLOAT_PART)?
  ;

fragment FLOAT_PART
  : DECIMAL '.' DECIMAL?
  | DECIMAL? '.' DECIMAL
  ;

fragment SIGN
  : ('+' | '-')
  ;

NEWLINE
  : '\n'
  ;

WHITESPACE
  : [ \r\t]+ -> skip
  ;
