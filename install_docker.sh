#!/bin/bash
set -e

# Fix dépôts CentOS 7 EOL
sudo sed -i -e 's/mirror.centos.org/vault.centos.org/g' \
           -e 's/^#.*baseurl=http/baseurl=http/g' \
           -e 's/^mirrorlist=http/#mirrorlist=http/g' \
           /etc/yum.repos.d/*.repo

# Mise à jour
sudo yum -y update

# Installer prérequis
sudo yum install -y yum-utils git curl wget

# Installer Docker
sudo yum remove -y docker docker-client docker-common || true
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable --now docker
sudo usermod -aG docker vagrant

echo "✅ Docker installé. IP de la VM : $(ip -4 addr show enp0s8 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"
