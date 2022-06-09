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
%token IF
%token WHILE

%type <dval> calcul expression terme affectation condition boucle egalitee
%left '+' '-'
%left '/' '*' '%'
%right '^'
%left '(' ')'


%%
ligne : 		calcul FIN
	  |			calcul FIN ligne
	  ;

calcul:  		expression	  {printf("Résultat : %d \n\n",$1);}
	  |	    	affectation	  {printf("%s \n", t);}
	  |	    	condition
	  |			boucle
  	  ;


expression : 	expression '+' expression {$$ = $1 + $3;}
	  |			expression '/' expression {$$ = $1 / $3;}
	  |			expression '-' expression {$$ = $1 - $3;}
	  |			expression '*' expression {$$ = $1 * $3;}
	  |			expression '%' expression {$$ = $1 % $3;}
	  |			expression '^' expression {$$ = pow($1,$3);}
	  |			'(' expression ')'	  {$$ = $2;}
	  |			terme 			  {$$ = $1;}
	  |			'-' terme		  {$$ = - $2;}
	  ;

affectation : 	VARIABLE '=' expression {t[$1] = $3;};


terme :			NOMBRE		   {$$ = $1;}
	  |	   	 	VARIABLE	   {$$ = t[$1];}
	  ; 

condition : 	IF '(' egalitee ')' calcul {printf("");};

boucle	  : 	WHILE '(' egalitee ')' calcul {printf("Pas encore terminé\n");};

egalitee : 	    expression  '=' '=' expression {if(!($1 == $4)) {yyerror("Condition pas validée"); return 0;}}
	  |			expression  '<' '=' expression {if(!($1 <= $4)) {yyerror("Condition pas validée"); return 0;}}
	  |			expression  '>' '=' expression {if(!($1 >= $4)) {yyerror("Condition pas validée"); return 0;}}
	  |			expression  '<' expression {if(!($1 < $3)) {yyerror("Condition pas validée"); return 0;}}
	  |	  		expression  '>' expression {if(!($1 > $3)) {yyerror("Condition pas validée"); return 0;}}
	  ;
%%



#include "lex.yy.c"

int yyerror(char *s) 
{printf("%s\n",s);return 0;}

int main() {
	printf("\n ~~~~~~~ Calculatrice prête ~~~~~~~\n \n");
	yyparse();
}
