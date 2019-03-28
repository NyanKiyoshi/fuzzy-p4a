# P4a : Analyse de performances de différentes structures

[Grille d'évaluation P4a](https://docs.google.com/spreadsheets/d/1Ki0FJpb8fR_yDCS4hYwoEPKs_Ap4UxTZ5MOpkdj0GVU/edit#gid=0)

## Problème

Lors du développement d'une application en Java (ou dans un autre langage), nous utilisons très régulièrement des `Collections` pour stocker des données. Cependant, chaque implémentation de cette interface possède des avantages et des inconvénients, tout dépend de l'utilisation que l'on va en faire.
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

| Opération            | ArrayList                 | LinkedList                | HashSet                   | Comparaison               |
|----------------------|---------------------------|---------------------------|---------------------------|---------------------------|
| Insertion            | ![plot](plots/ExecTime_ArrayList_add_.jpg) | ![plot](plots/ExecTime_LinkedList_add_.jpg) | ![plot](plots/ExecTime_HashSet_add_.jpg) | ![plot](plots/ExecTime_toutes_add_.jpg) |
| Accès                | ![plot](plots/ExecTime_ArrayList_contains_.jpg) | ![plot](plots/ExecTime_LinkedList_contains_.jpg) | ![plot](plots/ExecTime_HashSet_contains_.jpg) | ![plot](plots/ExecTime_toutes_contains_.jpg) |
| Suppression          | ![plot](plots/ExecTime_ArrayList_remove_.jpg) | ![plot](plots/ExecTime_LinkedList_remove_.jpg) | ![plot](plots/ExecTime_HashSet_remove_.jpg) | ![plot](plots/ExecTime_toutes_remove_.jpg) |
| Vue d'ensemble       | ![plot](plots/ExecTime_ArrayList_tous_.jpg) | ![plot](plots/ExecTime_LinkedList_tous_.jpg) | ![plot](plots/ExecTime_HashSet_tous_.jpg) |                          |

### Consommation mémoire

| Opération            | ArrayList                 | LinkedList                | HashSet                   | Comparaison               |
|----------------------|---------------------------|---------------------------|---------------------------|---------------------------|
| Insertion            | ![plot](plots/MemoryUsage_ArrayList_add_.jpg) | ![plot](plots/MemoryUsage_LinkedList_add_.jpg) | ![plot](plots/MemoryUsage_HashSet_add_.jpg) | ![plot](plots/MemoryUsage_toutes_add_.jpg) |
| Accès                | ![plot](plots/MemoryUsage_ArrayList_contains_.jpg) | ![plot](plots/MemoryUsage_LinkedList_contains_.jpg) | ![plot](plots/MemoryUsage_HashSet_contains_.jpg) | ![plot](plots/MemoryUsage_toutes_contains_.jpg) |
| Suppression          | ![plot](plots/MemoryUsage_ArrayList_remove_.jpg) | ![plot](plots/MemoryUsage_LinkedList_remove_.jpg) | ![plot](plots/MemoryUsage_HashSet_remove_.jpg) | ![plot](plots/MemoryUsage_toutes_remove_.jpg) |
| Vue d'ensemble       | ![plot](plots/MemoryUsage_HashSet_tous_.jpg) | ![plot](plots/MemoryUsage_LinkedList_tous_.jpg) | ![plot](plots/MemoryUsage_ArrayList_tous_.jpg) |                          |

### Analyse des résultats préalables

En regardant les graphiques générés, nous pouvons de suite remarquer que le temps d'éxécution et la consommation mémoire sont totalements différents selon la structure.

- Au niveau du temps d'éxécution, le `HashSet` est largement plus rapide que les 2 autres structures pour l'accès et la suppression, cependant il est moins rapide pour l'insertion. <br/>
De plus, l'`ArrayList` est légèrement plus performante que la `LinkedList` sur les 3 opérations.

- Au niveau de la consommation mémoire, c'est l'inverse puisque c'est le `HashSet` qui est le plus gourmand, peu importe l'opération réalisée.<br/>
Pour l'accès et la suppression, la `LinkedList` est un peu plus rapide que l'`ArrayList` mais quand il s'agit d'insérer des éléments la consommation mémoire de la liste chaînée explose à partir d'un certain nombre d'éléments.

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
