%{
#define MAX 30
int T[MAX];
%}

%%
[a-zA-Z]+ T[yyleng]++;
. |
\n;
%%

int yywrap() {
    int k ;
    
    for(k = 0; k < MAX; k++) 
        if(T[k] > 0) 
            printf("%d est de longueur %d\n",T[k],k);
    
    exit(0);
}

int main() {  
    FILE * fichier = fopen ("Exo1AllWord.txt", "r") ;
    yyin = fichier;
    
    yylex();

    exit(0);
}