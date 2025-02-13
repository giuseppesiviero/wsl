#!/bin/bash

# https://docs.docker.com/engine/install/ubuntu/

echo "Installazione Docker CLI"

echo "Aggiornamento dei pacchetti e installazione delle dipendenze necessarie..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

echo "Creazione della directory per le chiavi GPG..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "Scaricamento e configurazione della chiave GPG ufficiale di Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "Aggiunta del repository di Docker alle sorgenti di APT..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $($(. /etc/os-release && echo $VERSION_CODENAME)) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Aggiornamento dei pacchetti..."
sudo apt-get update

echo "Installazione di Docker e dei suoi componenti..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Creazione del gruppo Docker e aggiunta dell'utente corrente..."
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "Installazione di Docker completata con successo!"
echo "Puoi verificare lo stato del servizio Docker con 'sudo systemctl status docker' ed eseguire un container di prova con 'docker run hello-world'."

