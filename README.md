# P4a : Analyse de performances de différentes structures

[Grille d'évaluation P4a](https://docs.google.com/spreadsheets/d/1Ki0FJpb8fR_yDCS4hYwoEPKs_Ap4UxTZ5MOpkdj0GVU/edit#gid=0)

## Problème

Lors du développement d'une application en Java (ou dans un autre langage), nous utilisons très régulièrement des `Collections` pour stocker des données. Cependant chaque implémentation de cette interface possède des avantages et des inconvénients, tout dépend de l'utilisation que l'on va en faire.
Notre but est de comparer le temps d'éxécution et d'utilisation mémoire de différentes collections afin de voir laquelle est la plus performante.

Pour ce faire, nous allons tester 3 opérations différentes :
- L'*insertion* d'un élément
- L'*accès* à un élément
- La *suppression* d'un élément

Nous avons choisi de réaliser nos tests sur les structures suivantes de l'interface `ICollection` :
- `ArrayList`
- `LinkedList`
- `HashSet`

Afin d'observer les différences de temps d'exécution et d'utilisation mémoire, nous allons faire jouer les paramètres suivants afin
de pouvoir choisir laquelle répond le mieux à notre problème :
- Le nombre de tests par opération
- La taille de notre structure

## Dispositif expérimental

### Application

[Code source de l'application Java](chemin)

```
java Main <interface> <operation> <size>
```
```
interface:
    0 => ArrayList
    1 => LinkedList
    2 => HashSet

operation:
  	0 => Add
  	1 => Contains
  	2 => Remove
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

| Opération            | ArrayList                 | LinkedList                | HashSet                   |
|----------------------|---------------------------|---------------------------|---------------------------|
| Insertion            | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |
| Accès                | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |
| Suppression          | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |

### Consommation mémoire

| Opération            | ArrayList                 | LinkedList                | HashSet                   |
|----------------------|---------------------------|---------------------------|---------------------------|
| Insertion            | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |
| Accès                | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |
| Suppression          | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) | ![plot](path/to/plot.png) |

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
