#!/bin/bash

echo "Adding Helm GPG key..."
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -

echo "Installing apt-transport-https..."
sudo apt-get install -y apt-transport-https

echo "Adding Helm repository to APT sources..."
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

echo "Updating packages..."
sudo apt-get update

echo "Installing Helm..."
sudo apt-get install -y helm

echo "Helm installation completed successfully!"
echo "You can verify the Helm installation by running the command 'helm version'."
