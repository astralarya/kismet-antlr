// Kismet Grammar

parser grammar KismetParser;

options {
  tokenVocab = KismetLexer;
}

// Parser

start
  : statement? ((NEWLINE | SEMICOLON) statement?)*
  ;

statement
  : assignment
  | expr
  ;

assignment
  : variable ASSIGN expr
  ;

expr
  : andExpr (OR andExpr)*
  ;

andExpr
  : cmprExpr (AND cmprExpr)*
  ;

cmprExpr
  : addExpr (comparison addExpr)?
  ;

addExpr
  : multExpr ((PLUS | MINUS) multExpr)*
  ;

multExpr
  : powExpr ((TIMES | DIV | IDIV | MOD) powExpr)*
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
  | boolean
  | LPAREN expr RPAREN
  ;

number
  : NUMBER
  ;

boolean
  : TRUE
  | FALSE
  | NULL
  | UNDEFINED
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
