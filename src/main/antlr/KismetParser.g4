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
  : id ASSIGN expr
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
  | id
  | literal
  | string
  | LPAREN expr RPAREN
  ;

number
  : DECIMAL
  | HEXADECIMAL
  | BINARY
  | FLOAT
  ;

id
  : ID
  ;

literal
  : TRUE
  | FALSE
  | NULL
  | UNDEFINED
  ;

string
  : STRING
  ;

function
  : id LPAREN expr (COMMA expr)* RPAREN
  | roll_func LPAREN expr (COMMA expr)* RPAREN
  ;

roll_func
  : atom? DIE POINT id
  ;

roll
  : atom? ROLL
  ;

comparison
  : EQ
  | GT
  | LT
  | GTE
  | LTE
;
