#!/bin/bash

# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

# Download the latest stable version of kubectl
echo "Downloading the latest stable version of kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Install kubectl
echo "Installing kubectl..."
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Verify the installed kubectl version
echo "Verifying the installed kubectl version..."
kubectl version --client

# Check if kubectl was successfully installed
if [ $? -ne 0 ]; then
    echo "Error during kubectl installation verification."
    exit 1
fi

# Inform the user that kubectl installation was successful
echo "kubectl installation completed successfully!"

# Provide usage example for kubectl
echo "You can start using kubectl by running commands like 'kubectl get nodes'."


