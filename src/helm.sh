#!/bin/bash

echo "Aggiunta della chiave GPG di Helm..."
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -

echo "Installazione di apt-transport-https..."
sudo apt-get install -y apt-transport-https

echo "Aggiunta del repository di Helm alle sorgenti di APT..."
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

echo "Aggiornamento dei pacchetti..."
sudo apt-get update

echo "Installazione di Helm..."
sudo apt-get install -y helm

echo "Installazione di Helm completata con successo!"
echo "Puoi verificare l'installazione di Helm eseguendo il comando 'helm version'."
