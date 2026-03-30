# TP : Installation, Configuration et Sécurisation MQTT sur Ubuntu

Ce dépôt contient les fichiers nécessaires à la réalisation du TP sur l'installation, la configuration et la sécurisation d'un broker MQTT, y compris son déploiement via Docker Compose.

## Contenu du dépôt

*   `scripts/setup_mqtt.sh` : Un script Bash pour automatiser la génération des certificats TLS et la création du fichier de mots de passe pour Mosquitto.
*   `config/mosquitto.conf` : Le fichier de configuration du broker Mosquitto, incluant l'authentification par mot de passe, le TLS et les ACL.
*   `config/acl` : Le fichier de contrôle d'accès (ACL) pour définir les permissions des utilisateurs sur les topics MQTT.
*   `docker-compose.yml` : Le fichier Docker Compose pour déployer le broker Mosquitto avec la configuration sécurisée.
*   `.gitignore` : Fichier pour exclure les fichiers sensibles (clés privées, certificats générés) du suivi Git.

## Comment utiliser ce TP

1.  **Cloner le dépôt** :
    ```bash
    git clone [URL_DU_DEPOT]
    cd TP2-3-MQTT
    ```
2.  **Préparer la configuration** :
    Exécutez le script `setup_mqtt.sh` pour générer les certificats TLS auto-signés et créer le fichier de mots de passe (`passwd`).
    ```bash
    chmod +x scripts/setup_mqtt.sh
    ./scripts/setup_mqtt.sh
    ```
    *Note : Ce script créera les fichiers nécessaires dans le dossier `config/`.*

3.  **Lancer le broker MQTT avec Docker Compose** :
    Une fois la configuration préparée, utilisez Docker Compose pour démarrer le broker Mosquitto.
    ```bash
    docker-compose up -d
    ```
    Vous pouvez vérifier les logs du conteneur :
    ```bash
    docker-compose logs -f mqtt-broker
    ```

4.  **Tester la sécurisation** :
    Utilisez les clients `mosquitto_pub` et `mosquitto_sub` pour tester les différentes configurations de sécurité (authentification, TLS, ACL) comme indiqué dans le document du TP.

## Note importante sur la sécurité

Conformément aux bonnes pratiques, les clés privées et les certificats générés par le script `setup_mqtt.sh` sont créés localement et ne sont **pas** inclus dans ce dépôt Git. Ce dépôt fournit les outils et la configuration pour les générer et les utiliser en toute sécurité.
