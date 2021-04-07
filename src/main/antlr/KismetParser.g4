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

arguments
  : LPAREN (argumentList COMMA?)? RPAREN
  ;

argumentList
  : argument (COMMA argument)*
  ;

argument
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
  | expr DIE # exprDieExpr
  | DIE # DieExpr
  | expr POW expr # powExpr
  | expr arguments # argumentsExpr
  | (PLUS | MINUS) expr # unarySignExpr
  | expr (TIMES | DIV | IDIV | MOD) expr # multipyExpr
  | expr (PLUS | MINUS) expr # addExpr
  | expr (EQ | GT | LT | GTE | LTE) expr # compareExpr
  | expr AND expr # AndExpr
  | expr OR expr # OrExpr
  | expr ASSIGN expr # assignExpr
  | literal # atomExpr
  | id # idExpr
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

