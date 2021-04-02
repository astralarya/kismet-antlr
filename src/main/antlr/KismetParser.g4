// Kismet Grammar

parser grammar KismetParser;

options {
  tokenVocab = KismetLexer;
}

// Parser

start
  : expr*
  ;

expr
  : multExpr ((PLUS | MINUS) multExpr)*
  ;

multExpr
  : powExpr ((TIMES | DIV) powExpr)*
  ;

powExpr
  : signedAtom (POW signedAtom)*
  ;

signedAtom
  : PLUS signedAtom
  | MINUS signedAtom
  | function
  | roll
  | atom
  ;

atom
  : number
  | variable
  | constant
  | LPAREN expr RPAREN
  ;

number
  : NUMBER
  ;

constant
  : PI
  | EULER
  | I
  ;

variable
  : VARIABLE
  ;

function
  : roll_func LPAREN expr (COMMA expr)* RPAREN
  | variable LPAREN expr (COMMA expr)* RPAREN
  ;

roll_func
  : atom? ROLL_FUNC
  ;

roll
  : atom? ROLL
  ;

die
  : DIE
  ;

comparison
  : EQ
  | GT
  | LT
  | GTE
  | LTE
;
