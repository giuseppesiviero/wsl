#!/bin/bash

# https://docs.docker.com/engine/install/ubuntu/

echo "Installing Docker CLI"

# Update packages and install necessary dependencies
echo "Updating packages and installing necessary dependencies..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Create directory for GPG keys
echo "Creating directory for GPG keys..."
sudo install -m 0755 -d /etc/apt/keyrings

# Download and configure the official Docker GPG key
echo "Downloading and configuring the official Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository to APT sources
echo "Adding Docker repository to APT sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $($(. /etc/os-release && echo $VERSION_CODENAME)) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update packages
echo "Updating packages..."
sudo apt-get update

# Install Docker and its components
echo "Installing Docker and its components..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Create Docker group and add the current user
echo "Creating Docker group and adding the current user..."
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Installation completed
echo "Docker installation completed successfully!"
echo "You can verify the Docker service status with 'sudo systemctl status docker' and run a test container with 'docker run hello-world'."

