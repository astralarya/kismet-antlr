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
  : variable LPAREN expr (COMMA expr)* RPAREN
  ;

comparison
  : EQ
  | GT
  | LT
  | GTE
  | LTE
;
