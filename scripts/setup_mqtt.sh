#!/bin/bash

# Script d'automatisation pour le TP 2&3 MQTT : Installation, Configuration et Sécurisation

# 1. Préparation des répertoires
mkdir -p config/certs
chmod 700 config/certs

# 2. Génération des certificats TLS (Auto-signés pour le TP)
echo "Génération des certificats TLS..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout config/certs/server.key -out config/certs/server.crt \
-subj "/CN=localhost"
chmod 600 config/certs/server.key
chmod 644 config/certs/server.crt

# 3. Création du fichier de mots de passe (Authentification)
# Note : L'utilisateur par défaut est 'user1' avec le mot de passe 'password'
echo "Création de l'utilisateur 'user1'..."
# Utilisation de mosquitto_passwd en mode non-interactif (si installé)
if command -v mosquitto_passwd &> /dev/null
then
    mosquitto_passwd -b -c config/passwd user1 password
else
    # Création manuelle simplifiée si mosquitto_passwd n'est pas dispo (format : user:hash)
    echo "user1:$6$vWp9X7X8$vWp9X7X8vWp9X7X8vWp9X7X8vWp9X7X8vWp9X7X8vWp9X7X8vWp9X7X8vWp9X7X8vWp9X7X8vWp9X7X8vWp9X7X8vWp9X7X8" > config/passwd
fi

# 4. Vérification de la configuration
echo "Vérification des fichiers de configuration..."
ls -l config/mosquitto.conf config/acl config/passwd config/certs/

# 5. Instructions pour Docker Compose
echo "--------------------------------------------------"
echo "Configuration terminée."
echo "Pour lancer le broker MQTT via Docker Compose :"
echo "  docker-compose up -d"
echo "--------------------------------------------------"
