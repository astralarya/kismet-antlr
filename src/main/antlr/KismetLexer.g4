// Kismet Grammar

lexer grammar KismetLexer;

// Lexer

LPAREN
  : '('
  ;

RPAREN
  : ')'
  ;

LBRACKET
  : '['
  ;

RBRACKET
  : ']'
  ;

LBRACE
  : '{'
  ;

RBRACE
  : '}'
  ;

PLUS
  : '+'
  ;

MINUS
  : '-'
  ;

TIMES
  : '*'
  ;

DIV
  : '/'
  ;

IDIV
  : '//'
  ;

MOD
  : '%'
  ;

ASSIGN
  : '='
  ;

GT
  : '>'
  ;

LT
  : '<'
  ;

GTE
  : '>='
  | '≥'
  ;

LTE
  : '<='
  | '≤'
  ;

EQ
  : '=='
  ;

NEQ
  : '!='
  | '≠'
  ;

AND
  : '&&'
  ;

OR
  : '||'
  ;

COMMA
  : ','
  ;

POINT
  : '.'
  ;

POW
  : '^'
  ;

ROLL
  : DIE ('0' .. '9')+
  ;

ROLL_FUNC
  : DIE '.' VARIABLE
  ;

DIE
  : 'd'
  | 'D'
  ;

TRUE
  : 'true'
  ;

FALSE
  : 'false'
  ;

NULL
  : 'null'
  ;

UNDEFINED
  : 'undefined'
  ;

VARIABLE
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

fragment HEX
  : [0-9a-fA-F]
  ;

fragment HEXADECIMAL_CHAR
  : HEX | '_'
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

SEMICOLON
  : ';'
  ;

WHITESPACE
  : [ \r\t]+ -> skip
  ;
