// Kismet Grammar

lexer grammar KismetLexer;

// Lexer

PLUS
  : '+'
  ;

NUMBER
  : [0-9]+
  ;

WHITESPACE
  : [ \n]+ -> skip
  ;
