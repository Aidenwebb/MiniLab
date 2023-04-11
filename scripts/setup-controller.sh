#!/bin/sh
# This script is used to setup the controller node

apt-get update
apt-get upgrade

# Install git, pip and make
apt-get install -y git
apt-get install -y python-pip
apt-get install -y make
apt-get install -y cpio
apt-get install -y zstd

# Install ansible

pip install ansible
ansible-galaxy collection install community.general

# Install Docker

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi