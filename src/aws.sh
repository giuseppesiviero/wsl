#!/bin/bash

# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

# Begin AWS CLI installation
echo "Starting AWS CLI installation, a set of command-line tools for managing Amazon Web Services resources directly from the terminal."

# 1. Install unzip:
echo "Installing unzip..."
sudo apt-get install -y unzip

# 2. Download the AWS CLI package:
echo "Downloading the AWS CLI package..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# 3. Unzip the package:
echo "Unzipping the AWS CLI package..."
unzip awscliv2.zip

# 4. Install AWS CLI:
echo "Installing AWS CLI..."
sudo ./aws/install

# 5. Verify the installation:
echo "Verifying AWS CLI version..."
aws --version

# 6. Remove the ZIP file:
echo "Removing awscliv2.zip file..."
rm -f awscliv2.zip

# End installation
echo "AWS CLI installation completed!"
