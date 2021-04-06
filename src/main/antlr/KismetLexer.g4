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

VARIABLE
  : ID_START ID_CHAR*
  ;

fragment ID_START
  : ('a' .. 'z') | ('A' .. 'Z') | '_'
  ;

fragment ID_CHAR
  : ID_START | ('0' .. '9')
  ;

NUMBER
  : NUMBER_PART (('e' | 'E') SIGN? NUMBER_PART)?
  ;

fragment NUMBER_PART
  : ('0' .. '9')+ ('.' ('0' .. '9')+)?
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
