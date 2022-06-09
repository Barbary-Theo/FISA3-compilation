

%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"

%}


%%
[0-9]+|[0-9]*\.[0-9]+ {yylval.dval = atof(yytext); return NOMBRE;};
[a-z]                 {yylval.ival = yytext[0] - 'a'; return VARIABLE;};
if                    {return IF;};
while                 {return WHILE;};
\n                    {return FIN;};
[ \t]                 ;
.                     {return yytext[0];};
%%

int yywrap()
{ return 1; }

