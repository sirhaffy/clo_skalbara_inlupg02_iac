#!/bin/bash

# Log all commands for debugging
exec > >(tee /var/log/user-data.log) 2>&1
echo "$(date): Starting user-data script execution"

# Update the system
echo "$(date): Updating system packages"
dnf update -y

# Install necessary packages
echo "$(date): Installing SSH packages"
dnf install -y openssh-server openssh-clients

# Ensure SSH service is enabled and started
echo "$(date): Enabling and starting SSH service"
systemctl enable sshd
systemctl start sshd

# Configure SSH for security
echo "$(date): Configuring SSH security settings"
# Backup original config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

# Basic SSH hardening
cat >> /etc/ssh/sshd_config << 'EOF'
# Bastion host SSH configuration
Port 22
Protocol 2

# Network settings
TCPKeepAlive yes
ClientAliveInterval 60
ClientAliveCountMax 3
MaxAuthTries 3
MaxSessions 10
X11Forwarding no
PrintMotd no

# Security settings
PermitRootLogin no
PermitEmptyPasswords no
PasswordAuthentication no
UsePAM yes
ChallengeResponseAuthentication no
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
EOF

# Configure firewall to allow SSH
echo "$(date): Configuring firewall for SSH"
if command -v ufw &> /dev/null; then
    ufw allow 22/tcp
    ufw --force enable
elif command -v firewall-cmd &> /dev/null; then
    firewall-cmd --permanent --add-service=ssh
    firewall-cmd --reload
fi

# Restart SSH service to apply configuration
echo "$(date): Restarting SSH service to apply configuration"
systemctl restart sshd

# Test SSH service
echo "$(date): Final SSH service status check"
systemctl status sshd
if systemctl is-active --quiet sshd; then
    echo "$(date): SSH service is running successfully"
else
    echo "$(date): ERROR - SSH service failed to start"
fi

echo "$(date): User-data script completed"

