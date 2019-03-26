# P4a : Analyse de performances de différentes structures

[Grille d'évaluation P4a](https://docs.google.com/spreadsheets/d/1Ki0FJpb8fR_yDCS4hYwoEPKs_Ap4UxTZ5MOpkdj0GVU/edit#gid=0)

## Problème

Nous recherchons la structure la plus performante point de vue de temps
d'exécution et d'utilisation mémoire pour répondre à nos besoins (langage Java).

On souhaite avoir une collection qui peut contenir un nombre
aléatoire de valeurs où l'on peut ensuite toujours, aussi efficacement que
possible, sur une valeur aléatoire, soit :
- L'ajouter ;
- Soit rechercher son exitance ;
- Soit la supprimer de la structure.

Pour cela, nous souhaitons donc tester les structures suivantes de l'interface
`ICollection` :
- `ArrayList` ;
- `LinkedList` ;
- Et `HashSet`.

Afin d'observer les différences de temps d'exécution et d'utilisation
mémoire, nous allons faire jouer les paramètres suivants afin
de pouvoir choisir laquelle répond le mieux à notre problème :
- Le nombre de test par structure et opération ;
- Et le nombre d'éléments à être traités par chaque opération.

## Dispositif expérimental

### Application

[code source de l'application](chemin)
```
- Un programme Java qui prend : STRUCTURE OPERATION SIZE

  Structure:
  	0 => ArrayList
  	1 => LinkedList
  	2 => HashSet

  Operation:
  	0 => Add
  	1 => Contains
  	2 => Remove

- Un programme Bash qui, de manière imbriquée, teste les différentes structures
  en leur passant une taille aléatoire.
```

### Environnement de test

Extrait de `/proc/cpuinfo` :
```
```

### Description de la démarche systématique

Description de la démarche systématique et de l'espace d'exploration pour chaque paramètres.

```
Suite des commandes, ou script, à exécuter pour produire les données.
```

## Résultats préalables

### Temps d'exécution

| Opération            | Tableau                   | Liste chaînée             |                           |
|----------------------|---------------------------|---------------------------|---------------------------|
| Insertion            | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |
| Accès                | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |
|                      | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |

### Consommation mémoire

| Opération            | Tableau                   | Liste chaînée             |                           |
|----------------------|---------------------------|---------------------------|---------------------------|
| Insertion            | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |
| Accès                | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |
|                      | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |

### Analyse des résultats préalables

Explications précises et succinctes des résultats préalables.

### Discussion des résultats préalables

Explications précises et succinctes sur ce que les limites des résultats
préalables et ce qu'ils ne permettent pas de vérifier.

## Etude approfondie

### Hypothèse

Expression précise et succincte d'une hypothèse.

### Protocole expérimental de vérification de l'hypothèse

Expression précise et succincte du protocole.

```
Suite des commandes, ou script, à exécuter pour produire les données.
```

### Résultats expérimentaux

### Analyse des résultats expérimentaux

### Discussion des résultats expérimentaux

## Conclusion et travaux futurs
