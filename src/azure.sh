#!/bin/bash

# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

# Inizio installazione di Azure CLI
echo "Iniziamo l'installazione di Azure CLI, un insieme di strumenti di comando per gestire le risorse di Azure direttamente dal terminale."

# 1. Ottenere i pacchetti necessari per il processo di installazione:
echo "Aggiornamento dei pacchetti..."
sudo apt-get update

echo "Installazione di apt-transport-https, ca-certificates, curl, gnupg, e lsb-release..."
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# 2. Scaricare e installare la chiave di firma di Microsoft:
echo "Creazione della directory /etc/apt/keyrings se non esiste già..."
sudo mkdir -p /etc/apt/keyrings

echo "Scaricamento e installazione della chiave di firma Microsoft..."
curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null

echo "Impostazione delle autorizzazioni per la chiave..."
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

# 3. Aggiungere il repository software Azure CLI:
AZ_DIST=$(lsb_release -cs)
echo "Configurazione del repository Azure CLI per ${AZ_DIST}..."
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources

# 4. Aggiornare le informazioni del repository e installare il pacchetto azure-cli:
echo "Aggiornamento delle informazioni del repository..."
sudo apt-get update

echo "Installazione di Azure CLI..."
sudo apt-get install -y azure-cli

echo "Installazione completata!"