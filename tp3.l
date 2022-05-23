

%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"

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


int analyseWord(char * word) {

	if(currentType != -1) {
		insert(word);	
		printf("%s insert in type -> %d\n", word, currentType);
	}
	else {
		int wordType = search(word);
		printf(" %s : type of -> %d \n",word, wordType);
		
		return wordType;
	}
	return -1;

}


%}


%%
sujet {currentType = 0; }
verbe {currentType = 1; }
adjectif {currentType = 2; }
adverbe {currentType = 3; }
\n {currentType = -1; printf("end \n\n"); }
[a-zA-Z]+ {
	int res = analyseWord(yytext);
	if(res == 0) {
		return SUJET;
	}
	else if(res == 1) {
		return VERBE;
	}
	else if(res == 2) {
		return ADJ;
	}
	else if(res == 3) {
		return ADV;
	}
	else if (currentType == -1) {	
		printf("Mot inconnu");
		return 0;
	}
}
%%

int yywrap()
{ return 1; }

