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
  : sumExpr
  ;

sumExpr
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

comparison
  : EQ
  | GT
  | LT
  | GTE
  | LTE
;
