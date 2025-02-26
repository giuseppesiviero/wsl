#!/bin/bash

# Update package list
echo "Updating package list..."
if sudo apt update; then
  echo "Package list updated successfully."
else
  echo "Failed to update package list." >&2
  exit 1
fi

# Check Java version
echo "Checking current Java version..."
if java -version; then
  echo "Java is already installed."
else
  echo "Java is not installed."
fi

# Install default JRE
echo "Installing default JRE..."
if sudo apt install default-jre -y; then
  echo "Default JRE installed successfully."
else
  echo "Failed to install default JRE." >&2
  exit 1
fi

# Verify JRE installation
echo "Verifying JRE installation..."
if java -version; then
  echo "JRE installation verified."
else
  echo "Failed to verify JRE installation." >&2
  exit 1
fi

# Install default JDK
echo "Installing default JDK..."
if sudo apt install default-jdk -y; then
  echo "Default JDK installed successfully."
else
  echo "Failed to install default JDK." >&2
  exit 1
fi

# Verify JDK installation
echo "Verifying JDK installation..."
if javac -version; then
  echo "JDK installation verified."
else
  echo "Failed to verify JDK installation." >&2
  exit 1
fi

# Installation completed
echo "Java installation completed successfully!"
