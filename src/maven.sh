#!/bin/bash

set -e

# Aggiorna i pacchetti e installa le dipendenze necessarie
sudo apt update && sudo apt install -y wget tar unzip

# Ottieni l'ultima versione di Maven
LATEST_VERSION=$(wget -qO- "https://api.github.com/repos/apache/maven/releases/latest" | grep 'tag_name' | cut -d '"' -f 4 | tr -d 'v')
MAVEN_URL="https://downloads.apache.org/maven/maven-3/$LATEST_VERSION/binaries/apache-maven-$LATEST_VERSION-bin.tar.gz"

# Scarica e installa Maven
wget "$MAVEN_URL" -O /tmp/maven.tar.gz
sudo tar -xzf /tmp/maven.tar.gz -C /opt/
sudo ln -sfn /opt/apache-maven-$LATEST_VERSION /opt/maven

# Configura le variabili d'ambiente
echo 'export MAVEN_HOME=/opt/maven' | sudo tee /etc/profile.d/maven.sh
echo 'export PATH=$MAVEN_HOME/bin:$PATH' | sudo tee -a /etc/profile.d/maven.sh
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

# Verifica l'installazione
mvn -version
