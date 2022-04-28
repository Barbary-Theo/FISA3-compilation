# Compilation sujet TP1

##Exercice 1 :

Reprendre l'exercice donné dans le diaporama Lex (histogramme des mots et l'exécuter).
Que : le texte analysé est saisi au clavier

Rajouter dans le programme la possibilité d'analyser un fichier en utilisant la variable yin
Dans main :
	File $ f = fopen("fichier.txt", "r") ;
	yin = f ;

##Exercice 2 :

Propgramme Lex affichant la nature (verbe ou non verbe) des mots dans des phrases saisies.
Exemple d'exécution :
Phrase saisie : je cours vite
Résultats :
Je non verbe
Cours verbe
Vite non verbe

Rque : les mots sont stockés en "dur" dans le programme Lex


##Exercice 3 :

Programme qui détermine la nature des mots dans des phrases saisies, en utilisant 2 étapes :
apprentissage et reconnaissance sujet, verbe, adjectif, ... en utilisant une liste chainée

%{
      #include <stdio.h>
      #include <string.h>
      définition type liste chainée : mot, catégori, suivant

      typedef liste struct
      déclaration d'une variable liste chainée
      déclaration des entêtes des fonctions définies dans la 3e partie
%}
%%
expressions régulières	actions
%%
fonction insertion d'un mot et de sa catégorie dans la liste chainée
fonction recherche de la catégorie d'un mot dans la liste chainée
fonction main

Exemple d'exécution :
sujet je tu il : il s'agit de l'apprentissage des sujets
je cours vite : il s'agit d'un test ; le programme reconnait le mot "je"
verbe cours suis marche : apprentissage des verbes
je cours vite : test ; le programme reconnait le sujet et le verbe
adjectif rapide, grand, petit : apprentissage des adjectif
je suis rapide : tetst ; le programme reconnait le sujet, le verbe et l'adjectif
