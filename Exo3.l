
%{
#include <stdio.h>
#include <string.h>

typedef struct list
{
    char word[30];
    int category;
    struct list * next;
}List;

List *l=NULL;

int currentType = -1;

void insert(char * word) {
	List* new = (List*)malloc(sizeof(List));
        strcpy(new-> word, word);
        new->category = currentType;
        new->next = l;
        l = new;
}


int search(char * word)
{
    List * list = l;
    int find = 0;
    while (list != NULL && (!find))
    {
        if (strcmp(word, list->word) == 0) find = 1;
        else list = list->next;
    }
    if (find) return list->category;
    else return -1;
}

void analyseWord(char * word) {

	if(currentType != -1) {
		insert(word);	
		printf("%s insert in -> %d\n", word, currentType);
	}
	else {
		printf(" %s type -> %d\n",word, search(word));
	}

}


%}


%%
sujet {currentType = 0; }
verbe {currentType = 1; }
adjectif {currentType = 2; }
\n {currentType = -1; printf("end \n\n");}
[a-zA-Z]+ {analyseWord(yytext);}
%%



int main() {
	printf("0 -> sujet \n1 -> verbe \n2 -> adjectif \n\n");
	yylex();
	exit(0);
}
