#!/bin/bash

set -e

# Aggiorna i pacchetti e installa le dipendenze necessarie
sudo apt update && sudo apt install -y openjdk-21-jdk

# Configura le variabili d'ambiente per Java
echo 'export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64' | sudo tee /etc/profile.d/java.sh
echo 'export PATH=$JAVA_HOME/bin:$PATH' | sudo tee -a /etc/profile.d/java.sh
sudo chmod +x /etc/profile.d/java.sh
source /etc/profile.d/java.sh

# Verifica l'installazione
java -version
