#!/bin/bash

# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

# Inizio installazione di AWS CLI
echo "Iniziamo l'installazione di AWS CLI, un insieme di strumenti di comando per gestire le risorse di Amazon Web Services direttamente dal terminale."

# 1. Installare unzip:
echo "Installazione di unzip..."
sudo apt-get install -y unzip

# 2. Scaricare il pacchetto AWS CLI:
echo "Scaricamento del pacchetto AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# 3. Decomprimere il pacchetto:
echo "Decompressione del pacchetto AWS CLI..."
unzip awscliv2.zip

# 4. Installare AWS CLI:
echo "Installazione di AWS CLI..."
sudo ./aws/install

# 5. Verificare l'installazione:
echo "Verifica della versione di AWS CLI..."
aws --version

# 6. Rimuovere il file ZIP:
echo "Rimozione del file awscliv2.zip..."
rm -f awscliv2.zip

# Fine installazione
echo "Installazione di AWS CLI completata!"
