#!/bin/bash

# Stop and remove all running containers
sudo docker rm -f $(sudo docker ps -aq)

# Remove all images
sudo docker rmi -f $(sudo docker images -q)

# Stop Docker service
sudo systemctl stop docker

# Unmount /var/lib/docker
sudo umount /var/lib/docker

# Remove /var/lib/docker directory
sudo rm -rf /var/lib/docker

# Recreate /var/lib/docker directory
sudo mkdir /var/lib/docker

# Create a directory for dev/mkdocker
sudo mkdir -p /dev/mkdocker

# Mount /dev/mkdocker to /var/lib/docker
sudo mount --rbind /dev/mkdocker /var/lib/docker

# Start Docker service
sudo systemctl start docker
