#!/bin/bash

# https://developer.hashicorp.com/terraform/install

echo "Installazione Terraform CLI"
echo "Aggiornamento dei pacchetti e installazione delle dipendenze necessarie..."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

echo "Aggiunta della chiave GPG di HashiCorp..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

echo "Aggiunta del repository di HashiCorp alle sorgenti di APT..."
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

echo "Aggiornamento dei pacchetti e installazione di Terraform..."
sudo apt-get update && sudo apt-get install terraform

echo "Configurazione dell'autocompletamento per Terraform..."
touch ~/.bashrc
terraform -install-autocomplete

echo "Puoi verificare l'installazione eseguendo il comando 'terraform -version'."
terraform -version

echo "Installazione di Terraform completata con successo!"
