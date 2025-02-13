#!/bin/bash

# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

echo "Scaricamento dell'ultima versione stabile di kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

echo "Installazione di kubectl..."
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "Verifica della versione di kubectl installata..."
kubectl version --client

if [ $? -ne 0 ]; then
    echo "Errore durante la verifica dell'installazione di kubectl."
    exit 1
fi

echo "Installazione di kubectl completata con successo!"

echo "Puoi iniziare a utilizzare kubectl eseguendo comandi come 'kubectl get nodes'."
