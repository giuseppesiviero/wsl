#!/bin/bash

# Specify the workspace path
WORKSPACE_PATH="workspace/"

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}Git is not installed. Please install Git first.${NC}"
    exit 1
fi

# Check if the specified path exists and is a directory
if [ ! -d "$WORKSPACE_PATH" ]; then
    echo -e "${RED}The specified path does not exist or is not a directory.${NC}"
    exit 1
fi

# Log start time
echo -e "${BLUE}Script started at: $(date)${NC}"
echo -e "${BLUE}Listing directories in path: $WORKSPACE_PATH${NC}"
echo -e "${BLUE}-----------------------------${NC}"

# Iterate over each directory in the specified path
find "$WORKSPACE_PATH" -maxdepth 1 -type d | while IFS= read -r dir; do
    # Avoid processing the main directory itself
    if [ "$dir" == "$WORKSPACE_PATH" ]; then
        continue
    fi

    echo -e "${YELLOW}Found directory: $dir${NC}"

    # Check if it's a Git repository
    if [ -d "$dir/.git" ]; then
        echo -e "${GREEN}Found Git repository in $dir${NC}"
        pushd "$dir" > /dev/null

        echo -e "${BLUE}Running git fetch...${NC}"
        git fetch
        if [ $? -ne 0 ]; then
            echo -e "${RED}git fetch failed in $dir${NC}"
            popd > /dev/null
            continue
        fi

        echo -e "${BLUE}Running git pull...${NC}"
        git pull
        if [ $? -ne 0 ]; then
            echo -e "${RED}git pull failed in $dir${NC}"
            popd > /dev/null
            continue
        fi

        # Return to the original directory
        popd > /dev/null
    else
        echo -e "${RED}Not a Git repository: $dir${NC}"
    fi
done

# Log end time
echo -e "${BLUE}-----------------------------${NC}"
echo -e "${GREEN}Script completed at: $(date)${NC}"
