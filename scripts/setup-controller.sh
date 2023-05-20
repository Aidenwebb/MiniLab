#!/bin/sh
# This script is used to setup the controller node

sudo yum update -y

# Install git, pip and make
sudo yum install -y git
sudo yum install -y python-pip
sudo yum install -y make

# Install ansible

pip install ansible

# Install Docker

sudo curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $USER