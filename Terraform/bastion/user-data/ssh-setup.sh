#!/bin/bash

# Log all commands for debugging
exec > >(tee /var/log/user-data.log) 2>&1

dnf update -y
dnf install -y openssh-server openssh-clients

# Ensure SSH service is enabled and started
systemctl enable sshd
systemctl start sshd

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

