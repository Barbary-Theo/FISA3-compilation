%{
#define MAX 30
int T[MAX];
%}

%%
cours |
manger |
dors |
faire {printf("%s -> verbe\n",yytext);}
[a-zA-Z]+ {printf("%s -> non verbe\n",yytext);}
%%
