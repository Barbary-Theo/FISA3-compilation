%{
#include <stdio.h>
#include <math.h>
#include "y.tab.h"
int yylex();
int yyparse(); 
int yyerror(); 

char t[26];

%}

%start ligne
%union {int dval; int ival; char cval;}
%token <dval> NOMBRE
%token <cval> VARIABLE
%token FIN
%type <dval> calcul expression terme affectation
%left '+' '-'
%left '/' '*' '%'
%right '^'
%left '(' ')'


%%
ligne : 	calcul FIN
	  |	calcul FIN ligne
	  ;

calcul:  	expression	  {printf("Résultat : %d \n\n",$1);}
	  |	affectation	  {printf("\n %s \n", t);}
  	  ;


expression : 	expression '+' expression {$$ = $1 + $3;}
	  |	expression '/' expression {$$ = $1 / $3;}
	  |	expression '-' expression {$$ = $1 - $3;}
	  |	expression '*' expression {$$ = $1 * $3;}
	  |	expression '%' expression {$$ = $1 % $3;}
	  |	expression '^' expression {$$ = pow($1,$3);}
	  |	'(' expression ')'	  {$$ = $2;}
	  |	terme 			  {$$ = $1;}
	  |	'-' terme		  {$$ = - $2;}
	  ;

affectation: 	VARIABLE '=' expression {t[$1] = $3;}


terme :		NOMBRE		   {$$ = $1;}
	  |	VARIABLE	   {$$ = t[$1];}
	  ; 

%%



#include "lex.yy.c"

int yyerror(char *s) 
{printf("%s\n",s);return 0;}

int main() {
	printf("\n ~~~~~~~ Calculatrice prête ~~~~~~~\n \n");
	yyparse();
}
