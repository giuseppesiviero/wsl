#!/bin/sh

# Aggiorna la lista dei pacchetti
sudo apt update

# Installa Git
sudo apt install git -y

# Verifica l'installazione
git --version
