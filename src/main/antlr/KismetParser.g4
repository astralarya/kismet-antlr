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
  : expr
  ;

arrayLiteral
  : LBRACKET elementList COMMA? RBRACKET
  ;

arguments
  : LPAREN (elementList COMMA?)? RPAREN
  ;

elementList
  : element (COMMA element)*
  ;

element
  : ELLIPSIS? expr
  ;

exprSequence
  : expr (COMMA expr)*
  ;

expr
  : expr LBRACKET exprSequence RBRACKET # indexExpr
  | expr DOT ID # memberExpr
  | expr roll # exprRollExpr
  | roll # rollExpr
  | expr DIE arrayLiteral? # exprDieExpr
  | DIE arrayLiteral? # DieExpr
  | expr POW expr # powExpr
  | expr arguments # argumentsExpr
  | (PLUS | MINUS) expr # unarySignExpr
  | NOT expr # unaryNotExpr
  | expr (TIMES | DIV | IDIV | MOD) expr # multipyExpr
  | expr (PLUS | MINUS) expr # addExpr
  | expr (EQ | GT | LT | GTE | LTE) expr # compareExpr
  | expr AND expr # AndExpr
  | expr OR expr # OrExpr
  | expr ASSIGN expr # assignExpr
  | literal # atomExpr
  | id # idExpr
  | arrayLiteral # arrayLiteralExpr
  | LPAREN exprSequence RPAREN # parenExpr
  ;

roll
  : ROLL
  ;

id
  : ID
  ;

literal
  : nullLiteral
  | booleanLiteral
  | stringLiteral
  | numericLiteral
  ;

numericLiteral
  : DECIMAL
  | HEXADECIMAL
  | BINARY
  | FLOAT
  ;

booleanLiteral
  : TRUE
  | FALSE
  ;

nullLiteral
  : NULL
  | UNDEFINED
  ;

stringLiteral
  : STRING
  ;

