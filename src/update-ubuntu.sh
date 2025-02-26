#!/bin/bash

# Update the list of available packages
echo "Updating package list..."
sudo apt update

# Upgrade installed packages to the latest version
echo "Upgrading installed packages..."
sudo apt upgrade -y

# Perform a distribution upgrade, which also handles dependency changes
echo "Upgrading the distribution..."
sudo apt dist-upgrade -y

# Remove unnecessary packages
echo "Removing unnecessary packages..."
sudo apt autoremove -y

# Clean up the local repository of retrieved package files
echo "Cleaning up package cache..."
sudo apt autoclean

# Update all snap packages
echo "Updating snap packages..."
sudo snap refresh

# Display completion message
echo "System update completed!"
