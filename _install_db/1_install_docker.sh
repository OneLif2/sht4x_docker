#!/bin/bash

# install docker from vscode extension is better...

# Update existing list of packages
sudo apt-get update

# Install a few prerequisite packages which let apt use packages over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Download the Docker installation script
curl -fsSL https://get.docker.com -o get-docker.sh

# Run the Docker installation script
sudo sh get-docker.sh

# Verify Docker is installed
sudo docker run hello-world