%{
#include <stdio.h>
#include <math.h>
#include "y.tab.h"
int yylex();
int yyparse(); 
int yyerror(); 

char t[26];

%}

%start c
%union {int dval; int ival; char cval;}
%token <dval> NOMBRE
%token <cval> VARIABLE
%token FIN
%type <dval> calcul expression terme affectation variable


%%
c : 		calcul FIN
	  |	calcul FIN c
	  ;

calcul:  	expression	  {printf("%d\n\n",$1);}
  	  ;


expression : 	terme '+' terme {$$ = $1 + $3;}
	  |	terme '/' terme {$$ = $1 / $3;}
	  |	terme '-' terme {$$ = $1 - $3;}
	  |	terme '*' terme {$$ = $1 * $3;}
	  |	terme '%' terme {$$ = $1 % $3;}
	  |	terme '^' terme {$$ = pow($1,$3);}
	  |	terme 		{$$ = $1;}
	  |	affectation
	  ;

affectation: 	variable '=' terme {t[$1]= $3;}

variable: 	VARIABLE 	   {$$ = t[$1];}
	  ;

terme :		NOMBRE		   {$$ = $1;}
	  |	variable	   {$$ = $1;}
	  ; 

%%



#include "lex.yy.c"

int yyerror(char *s) 
{printf("%s\n",s);return 0;}

int main() {
	printf("main de yacc test \n \n");
	yyparse();
}
