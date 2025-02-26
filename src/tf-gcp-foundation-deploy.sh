#!/bin/bash

CORE_PROJECT=""

# Prompt for Google Cloud login
echo "Are you logged in to Google Cloud Platform? (y/n)"
read login_response

if [ "$login_response" == "n" ]; then
    echo "Logging in to Google Cloud Platform..."
    gcloud auth application-default login || { echo "Login failed. Please try again."; exit 1; }
    echo "Setting default project..."
    gcloud config set $CORE_PROJECT || { echo "Failed to set project. Exiting."; exit 1; }
else
    echo "Have you already set the core project? (y/n)"
    read set_response
    if [ "$set_response" == "n" ]; then
        gcloud config set $CORE_PROJECT || { echo "Failed to set project. Exiting."; exit 1; }
    fi
fi

# Ask which component to deploy
echo "Which component of the foundation do you want to deploy via Terraform?"
cd .. || { echo "Failed to go to parent directory. Exiting."; exit 1; }
ls -d 0*
read directory
cd "$directory" || { echo "The folder does not exist. Exiting."; exit 1; }

# Check if the user has the latest code
echo "Do you have the latest code? (y/n)"
read code_response

if [ "$code_response" == "n" ]; then
    echo "Performing git pull..."
    cd .. || { echo "Failed to go to parent directory. Exiting."; exit 1; }
    git pull || { echo "Git pull failed. Please check your connection."; exit 1; }
    cd "$directory" || { echo "Failed to go to directory $directory. Exiting."; exit 1; }
    
    echo "Updating modules..."
    terraform init -upgrade || { echo "Terraform initialization failed. Exiting."; exit 1; }
    terraform get || { echo "Failed to get Terraform modules. Exiting."; exit 1; }
    terraform fmt -recursive
    terraform validate || { echo "Terraform validation failed. Exiting."; exit 1; }
    terraform plan || { echo "Terraform plan failed. Exiting."; exit 1; }
else
    echo "Is this your first time initializing the workspace? (y/n)"
    read init_response
    if [ "$init_response" == "y" ]; then
        terraform init || { echo "Terraform initialization failed. Exiting."; exit 1; }
    fi

    terraform fmt -recursive
    terraform validate || { echo "Terraform validation failed. Exiting."; exit 1; }
    terraform plan || { echo "Terraform plan failed. Exiting."; exit 1; }
fi

# Ask if the user wants to deploy or destroy the infrastructure
echo -n "Do you want to deploy the infrastructure? (y/n) "
read deploy_choice

if [ "$deploy_choice" == "y" ]; then
    terraform apply -auto-approve || { echo "Terraform apply failed. Exiting."; exit 1; }
else
    echo -n "Do you want to destroy the infrastructure? (y/n) "
    read destroy_choice
    if [ "$destroy_choice" == "y" ]; then
        terraform destroy -auto-approve || { echo "Terraform destroy failed. Exiting."; exit 1; }
    fi
fi

# Git pipeline steps
cd .. || { echo "Failed to go to parent directory. Exiting."; exit 1; }
echo "Terraform pipeline completed."

echo "Starting Git pipeline..."

git status || { echo "Failed to check Git status. Exiting."; exit 1; }

echo "Which files do you want to add? (you can use '.' for all files)"
read files_to_add
git add $files_to_add || { echo "Error adding files. Please check the file names and try again."; exit 1; }

echo "Enter the commit message:"
read commit_message
git commit -m "$commit_message" || { echo "Error during commit. Please check and try again."; exit 1; }

echo "Do you want to push the changes? (y/n)"
read push_response

if [ "$push_response" == "y" ]; then
    git push || { echo "Error during push. Please check and try again."; exit 1; }
else
    echo "Push has been canceled."
fi

echo "Git pipeline completed."
