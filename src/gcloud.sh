#!/bin/bash

# https://cloud.google.com/sdk/docs/install?hl=it

# Inizio installazione di Google Cloud SDK
echo "Iniziamo l'installazione del Google Cloud SDK, un insieme di strumenti di comando per gestire le risorse di Google Cloud direttamente dal terminale."

# 1. Installare i pacchetti necessari per il processo di installazione:
echo "Installazione di apt-transport-https, ca-certificates, e gnupg..."
sudo apt-get install -y apt-transport-https ca-certificates gnupg

# 2. Aggiungere il repository Google Cloud SDK:
echo "Aggiunta del repository Google Cloud SDK alla lista delle fonti..."
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# 3. Scaricare e installare la chiave di firma Google Cloud:
echo "Scaricamento e installazione della chiave di firma Google Cloud..."
sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# 4. Aggiornare le informazioni del repository e installare Google Cloud SDK:
echo "Aggiornamento delle informazioni del repository..."
sudo apt-get update

echo "Installazione di Google Cloud SDK..."
sudo apt-get install -y google-cloud-sdk

# 5. Inizializzare gcloud CLI
# echo "Inizializzazione di gcloud CLI..."
# gcloud init

echo "Installazione e inizializzazione di Google Cloud SDK completate!"
