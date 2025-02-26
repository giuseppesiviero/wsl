#!/bin/bash

# https://developer.hashicorp.com/terraform/install

echo "Installing Terraform CLI"
echo "Updating packages and installing necessary dependencies..."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

echo "Adding HashiCorp GPG key..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

echo "Adding HashiCorp repository to APT sources..."
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

echo "Updating packages and installing Terraform..."
sudo apt-get update && sudo apt-get install terraform

echo "Configuring Terraform autocompletion..."
touch ~/.bashrc
terraform -install-autocomplete

echo "You can verify the installation by running the command 'terraform -version'."
terraform -version

echo "Terraform installation completed successfully!"
