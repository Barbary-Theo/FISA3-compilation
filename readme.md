

# Premier rendu TP compilation 
(groupe Barbary Théo, Thibaut Martin)

🚨 Attention 🚨
Le TP 3 n'est pas encore tout à fait terminé.

## TP 1 

#### Exo1

1. Compilation Exo 1 :
```
lex Exo1.l
gcc -o execExo1 lex.yy.c -ll
./execExo1
```

2. Informations générales

Pour rappel, l'objectif de cet exercice est d'indiquer le nombre de mot de longueur n.

Pour le premier exercice vous avez donc un fichier text appelé exo1AllWord.txt.
Dans ce fichier, vous pouvez indiquer différents mots.

3. Exemple de résultat pour le fichier Exo1AllWord.txt de base

```
$: ./execExo1                  


1 mot(s) est de longueur 1
2 mot(s) est de longueur 2
1 mot(s) est de longueur 3
3 mot(s) est de longueur 7
```


#### Exo2

1. Compilation Exo 2 :
```
lex Exo2.l
gcc -o execExo2 lex.yy.c -ll
./execExo1
```

2. Informations générales

L'objectif de cet exercice est d'indiquer si un mot écrit dans le terminal est un verbe ou non. Pour cela, les verbes sont indiqués en dur dans le code. 
Les verbes suivants sont indiqués dans le code :
- cours
- manger
- dors

3. Exemple d'execution 

```
$: ./execExo2                  
bonjour
bonjour -> non verbe

cours
cours -> verbe

manger
manger -> verbe

dors
dors -> verbe

dort
dort -> non verbe
```


#### Exo3

1. Compilation Exo 3 :
```
lex Exo3.l
gcc -o execExo3 lex.yy.c -ll
./execExo1
```

2. Informations générales

L'objectif de cet exercice est de pouvoir ajouter des sujets/verbes/adjectifs dans un "dictionnaire". Après quoi, lors de l'écriture d'une phrase nous pourrons indiquer la nature des mots.

Pour l'ajout d'un mot dans le dictionnaire, il faut alors dans un premier temps dire sa nature puis les mots à ajouter. 
Pour demander la nature des mots d'une phrase, il faut simplement écrit la phrase.

3. Exemple d'execution 

```
$: ./execExo3                  
0 -> sujet 
1 -> verbe 
2 -> adjectif 

sujet je tu il elle nous vous ils elles
 je insert in -> 0
 tu insert in -> 0
 il insert in -> 0
 elle insert in -> 0
 nous insert in -> 0
 vous insert in -> 0
 ils insert in -> 0
 elles insert in -> 0
end 

verbe suis es est somme etes sont
 suis insert in -> 1
 es insert in -> 1
 est insert in -> 1
 somme insert in -> 1
 etes insert in -> 1
 sont insert in -> 1
end 

adjectif rouge bleu rapide
 rouge insert in -> 2
 bleu insert in -> 2
 rapide insert in -> 2
end 

je suis rapide
 je type -> 0
  suis type -> 1
  rapide type -> 2
end 

je suis jaune
 je type -> 0
  suis type -> 1
  jaune type -> -1
end 
```

On remarque bien que pour le dernier cas, le mot "jaune" n'a pas été ajouté dans la liste des adjectifs et est donc compté comme inconnu : -1.

## TP 2

1. Compilation TP 2 :
```
yacc -d tp2.y
flex tp2.l
gcc y.tab.c -ly -ll
./a.out
```

2. Informations générales

Cette fois, l'objectif est le même que celui de l'exo 3 du TP 1 à l'exception d'ajouter un traitement avec yacc pour indiquer si la phrase est correctement formée ou nous. À savoir, une phrase correctement formée correspond à la composition sujet verbe complement, avec complement qui est soit un adjectif soit un adverbe.

Pour le fonctionnement, nous devions cette fois utiliser yacc en plus de lex pour vérifier la bonne structure de la phrase. 
Nous avons défini un texte qui est défini soit par une phrase (pour la première phrase indiquée) soit d'un text puis d'une phrase (avec le text qui correspond au text précédemment écrit, donc un appel récursif et la phrase les éléments tout juste écrit). La phrase correspond à un SUJET VERBE complement et un complement soit ADJECTIF, soit ADVERBE.

3. Exemple d'execution

```
$: ./a.out
sujet il je tu
 il insert in type -> 0
 je insert in type -> 0
 tu insert in type -> 0
end 

verbe suis es est
 suis insert in type -> 1
 es insert in type -> 1
 est insert in type -> 1
end 

adjectif rouge bleu
 rouge insert in type -> 2
 bleu insert in type -> 2
end 

adverbe moi
 moi insert in type -> 3
end 

je suis moi
 je : type of -> 0 
  suis : type of -> 1 
  moi : type of -> 3 
Correct sentence ! 
end 

je suis bleu
 je : type of -> 0 
  suis : type of -> 1 
  bleu : type of -> 2 
Correct sentence ! 
end 

je bleu suis
 je : type of -> 0 
  bleu : type of -> 2 
syntax error
```

## TP 3


1. Compilation TP 3 :
```
yacc -d tp3.y
flex tp3.l
gcc y.tab.c -ly -ll
./a.out
```

2. Informations générales

Maintenant l'objetcif est de pouvoir indiquer des calculs et de nous retourner le résultat. Décomposé en plusieurs version, nous somme actuellement entrain de travailler sur la version pour stocker des variables, mais cette version n'est pas encore terminée.

Pour pouvoir réaliser ces calculs, le lex retourne les types d'éléments :

* un nombre -> NOMBRE
* un lettre minuscule -> VARIABLE
* la fin du phrase -> FIN (pour gérer la fin de la phrase)

De cette manière, nous avons un calcul définit par une expression (la 'phrase' indiquée), une expression est les différents calculs possibles donc : terme opérateurs(+, -, *, ...) terme, ou une affectation. Un terme peut être un NOMBRE ou un VARIABLE. Et une affectation est une VARIABLE '=' terme.

Pour l'instant, même si ça n'est pas terminé (comme vous pourrez le voir dans l'exemple ci-après) nous pouvons affecter une valeur à une première variable. Pour cela nous avons un tableau de 26 éléments pour stocker ces variables.

3. Exemple d'execution

```
2 + 2
4

4 * 2
8

4 / 2
2

4 - 2
2

4 % 2
0

3 % 2
1

4 ^ 2
16

a = 2
0

a
2

b = 3
0

b
0
```