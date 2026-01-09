# ProjetAlgo

Projet de développement d'algorithmes réalisé en Swift dans le cadre de la formation à Polytech Montpellier.

## Présentation
Ce projet implémente différents algorithmes (à préciser selon votre sujet). Il utilise **Swift Package Manager (SPM)** pour la gestion de la compilation et des dépendances.

## Structure du Projet
Le projet suit l'architecture standard d'un paquet Swift :

* **`Sources/`** : Contient tout le code source logique du projet. C'est ici que se trouvent vos fichiers `.swift`.
* **`Tests/`** : Contient les tests unitaires pour valider le bon fonctionnement de vos algorithmes.
* **`Package.swift`** : Le fichier de configuration maître. Il définit le nom du projet, les cibles de compilation et les bibliothèques externes utilisées.
* **`.gitignore`** : Configure Git pour ignorer les fichiers inutiles comme le dossier `.build`.

> **Note :** Le dossier `.build/` est généré automatiquement lors de la compilation et ne doit jamais être envoyé sur GitLab.

## 🚀 Installation et Lancement

### Prérequis
* Swift installé
* Un IDE comme **CLion** ou **VS Code** (avec l'extension Swift)

### Compilation
Pour compiler le projet manuellement via le terminal, utilisez :
```bash
swift build