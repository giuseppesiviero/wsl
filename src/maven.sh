#!/bin/bash

# Get the latest version of Maven from the official website
echo "Fetching the latest version of Maven..."
LATEST_VERSION=$(curl -s https://maven.apache.org/download.cgi | grep -oP 'apache-maven-\K[0-9]+\.[0-9]+\.[0-9]+' | head -1)

# Download the latest version of Maven
echo "Downloading Maven version $LATEST_VERSION..."
wget "https://downloads.apache.org/maven/maven-3/$LATEST_VERSION/binaries/apache-maven-$LATEST_VERSION-bin.tar.gz" -P /tmp

# Navigate to the temporary directory
echo "Navigating to the /tmp directory..."
cd /tmp

# Extract the Maven archive
echo "Extracting Maven archive..."
tar -xvzf "apache-maven-$LATEST_VERSION-bin.tar.gz"

# Copy Maven to the /opt directory
echo "Copying Maven to the /opt directory..."
sudo cp -r "apache-maven-$LATEST_VERSION" /opt/maven

# Remove the downloaded zip file
echo "Removing the downloaded zip file..."
rm -f "apache-maven-$LATEST_VERSION-bin.tar.gz"

# Maven installation completed
echo "Maven installation completed successfully!"
