#!/bin/sh

# Update package list
echo "Updating package list..."
sudo apt update

# Install Git
echo "Installing Git..."
sudo apt install git -y

# Verify installation
echo "Verifying Git installation..."
git --version

echo "Git installation completed!"
