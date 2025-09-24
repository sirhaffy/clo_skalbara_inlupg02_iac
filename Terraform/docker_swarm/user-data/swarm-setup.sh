#!/bin/bash

# Log all commands for debugging
exec > >(tee /var/log/user-data.log) 2>&1
echo "$(date): Starting Docker node setup"

dnf update -y
dnf install -y openssh-server openssh-clients docker

# Ensure SSH is running
systemctl enable sshd
systemctl start sshd

# Enable and start Docker
systemctl enable docker
systemctl start docker

# Add ec2-user to docker group
usermod -a -G docker ec2-user