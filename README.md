# brewinit

Ce script a pour objectif d'installer [brew](https://brew.sh/) ainsi que des applications cli et macOS présentes dans des fichiers dédiés.

Le script va également désactiver la création automatique des fichiers `.DS_Store` sur les partages réseau.

## Utilisation

1. Téléchargez ou clonez ce répertoire

   ```bash
   git clone https://github.com/jeremky/brewinit.git
   cd brewinit
   ```

2. Dans `config`, éditez `apps.cfg` et `cask.cfg` selon vos besoins

   > Les lignes commençant par `#` sont ignorées

3. Exécutez le script

   ```bash
   ./brewinit.sh
   ```

> [!IMPORTANT]
> Le script demandera votre mot de passe sudo pour l'opération concernant les fichiers `.DS_Store`
