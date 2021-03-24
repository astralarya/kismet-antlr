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
  : sum
  ;

sum
  : NUMBER PLUS NUMBER
  ;
