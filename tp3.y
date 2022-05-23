%{
#include <stdio.h>
#include "y.tab.h"
int yylex();
int yyparse(); 
int yyerror(); 
%}

%start text
%token SUJET
%token VERBE
%token ADJ
%token ADV
%token ERR

%%
text	: phrase | text phrase
phrase	: SUJET VERBE complement		{printf("Correct sentence ! \n");};
complement : ADJ
	   | ADV 
	   ;
%%

#include "lex.yy.c"

int yyerror(char *s) 
{printf("%s\n",s);return 0;}

int main() {
	printf("main de yacc test \n \n");
	yyparse();
}
