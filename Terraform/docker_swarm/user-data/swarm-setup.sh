#!/bin/bash

# Log all commands for debugging
exec > >(tee /var/log/user-data.log) 2>&1
echo "$(date): Starting Docker Swarm node user-data script execution"

# Update the system
echo "$(date): Updating system packages"
dnf update -y

# Install necessary packages
echo "$(date): Installing SSH and Docker packages"
dnf install -y openssh-server openssh-clients docker

# Ensure SSH service is enabled and started
echo "$(date): Enabling and starting SSH service"
systemctl enable sshd
systemctl start sshd

# Ensure Docker service is enabled (but not started yet - Ansible will handle Docker Swarm setup)
echo "$(date): Enabling Docker service"
systemctl enable docker

# Add ec2-user to docker group
echo "$(date): Adding ec2-user to docker group"
usermod -a -G docker ec2-user

# Test SSH service
echo "$(date): Final SSH service status check"
systemctl status sshd
if systemctl is-active --quiet sshd; then
    echo "$(date): SSH service is running successfully"
else
    echo "$(date): ERROR - SSH service failed to start"
fi

# Test Docker installation
echo "$(date): Docker version check"
docker --version

echo "$(date): Docker Swarm node user-data script completed"