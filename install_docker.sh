#!/bin/bash

# Mettre à jour les paquets
sudo apt-get update -y
sudo apt-get upgrade -y

# Installer les paquets nécessaires
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg lsb-release

# Ajouter la clé GPG officielle de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Ajouter le dépôt Docker stable
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mettre à jour les paquets à nouveau
sudo apt-get update -y

# Installer Docker Engine et Docker Compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Ajouter l’utilisateur vagrant au groupe docker (pour exécuter docker sans sudo)
sudo usermod -aG docker vagrant

# Activer et démarrer le service Docker
sudo systemctl enable docker
sudo systemctl start docker

# Vérifier l'installation
docker --version
docker compose version
