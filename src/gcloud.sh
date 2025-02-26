#!/bin/bash

# https://cloud.google.com/sdk/docs/install

# Begin Google Cloud SDK installation
echo "Starting Google Cloud SDK installation, a set of command-line tools for managing Google Cloud resources directly from the terminal."

# 1. Install the necessary packages for the installation process:
echo "Installing apt-transport-https, ca-certificates, and gnupg..."
sudo apt-get install -y apt-transport-https ca-certificates gnupg

# 2. Add the Google Cloud SDK repository:
echo "Adding the Google Cloud SDK repository to the sources list..."
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# 3. Download and install the Google Cloud signing key:
echo "Downloading and installing the Google Cloud signing key..."
sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# 4. Update repository information and install Google Cloud SDK:
echo "Updating repository information..."
sudo apt-get update

echo "Installing Google Cloud SDK..."
sudo apt-get install -y google-cloud-sdk

# 5. Initialize gcloud CLI
echo "Initializing gcloud CLI..."
gcloud init

echo "Google Cloud SDK installation and initialization completed!"