#!/bin/bash

# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt


# Option 1: Install with one command
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

## Option 2: Step-by-step installation instruction
## Begin Azure CLI installation
#echo "Starting Azure CLI installation, a set of command-line tools for managing Azure resources directly from the terminal."
#
## 1. Obtain the necessary packages for the installation process:
#echo "Updating packages..."
#sudo apt-get update
#
#echo "Installing apt-transport-https, ca-certificates, curl, gnupg, and lsb-release..."
#sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
#
## 2. Download and install the Microsoft signing key:
#echo "Creating the /etc/apt/keyrings directory if it doesn't already exist..."
#sudo mkdir -p /etc/apt/keyrings
#
#echo "Downloading and installing the Microsoft signing key..."
#curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
#
#echo "Setting permissions for the key..."
#sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
#
## 3. Add the Azure CLI software repository:
#AZ_DIST=$(lsb_release -cs)
#echo "Configuring the Azure CLI repository for ${AZ_DIST}..."
#echo "Types: deb
#URIs: https://packages.microsoft.com/repos/azure-cli/
#Suites: ${AZ_DIST}
#Components: main
#Architectures: $(dpkg --print-architecture)
#Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources
#
## 4. Update repository information and install the azure-cli package:
#echo "Updating repository information..."
#sudo apt-get update
#
#echo "Installing Azure CLI..."
#sudo apt-get install -y azure-cli

echo "Checking the installation"
az --version

echo "Installation completed!"