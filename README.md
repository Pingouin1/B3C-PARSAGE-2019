# B3C-PARSAGE-2019

Script de parsage de log en langage bash.

Les outils en ligne de commande utilisees:

- cat: la commande sed est un utilitaire qui parcourt un fichier texte ligne par ligne afin de lui appliquer un traitement ou un remplacement lorsque l'expression réguliere est verifiee.  
- grep: la commande grep permet de rechercher une chaîne de caractères ou un motif dans un fichier. 
- awk: awk est une commande et un langage de programmation a elle tout seule qui permet une recherche de chaînes et l'exécution d'actions sur les lignes sélectionnées. Elle est utile pour récuperer de l'information, générer des rapports, transformer des données entre autres.
- cut: la commande cut permet d'afficher des zones specifiques d'un fichier
- paste: la commande paste concatene les lignes de meme niveau des fichiers passes en argument

Execution: 

Placer vous dans le répertoire courant des logs et execute le script dans un interpréteur de ligne de commande en environnement shell bash:
```
    user@kali$ cd /logs_scan/
```
Obtenir le script
```
    user@kali$ ./parsage.sh
```

Le script rendras un fichier csv d'une ligne date pour chaque scanner utilise.

Il est possible d'ajouter à la ligne chaque fichier pour n'en faire qu'un en utilisant l'example d'utilisation suivant:
```
   user@kali$ ./parsage.sh
   user@kali$ paste -d '\n' 04.29.2019_fierce.csv 04.29.2019_nikto.csv 04.29.2019_nmap.csv > scanner_all.csv	
```  

Automatisation:

Il est possible de rajouter le script de parsage au python de rejeu des scans en rajoutant une ligne au script python:
```
    os.system("cd /logs_scan/ && ./parsage")
```
