// Kismet Grammar

lexer grammar KismetLexer;

// Lexer

LPAREN
  : '('
  ;

RPAREN
  : ')'
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

PI
  : 'pi'
  ;

EULER
  : E2
  ;

I
  : 'i'
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
  : NUMBER_PART ((E1 | E2) SIGN? NUMBER_PART)?
  ;

fragment NUMBER_PART
  : ('0' .. '9')+ ('.' ('0' .. '9')+)?
  ;

fragment E1
  : 'E'
  ;

fragment E2
  : 'e'
  ;

fragment SIGN
  : ('+' | '-')
  ;

WHITESPACE
  : [ \r\n\t]+ -> skip
  ;
