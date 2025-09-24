#!/bin/bash

# Update the system
dnf update -y

# Install necessary packages
dnf install -y openssh-server openssh-clients

# Ensure SSH service is enabled and started
systemctl enable sshd
systemctl start sshd

# Configure SSH for security
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
if command -v ufw &> /dev/null; then
    ufw allow 22/tcp
    ufw --force enable
elif command -v firewall-cmd &> /dev/null; then
    firewall-cmd --permanent --add-service=ssh
    firewall-cmd --reload
fi

# Restart SSH service to apply configuration
systemctl restart sshd

# Enable fail2ban for additional security (optional)
# dnf install -y epel-release
# dnf install -y fail2ban

# Configure fail2ban for SSH
# cat > /etc/fail2ban/jail.local << 'EOF'
# [DEFAULT]
# bantime = 3600
# findtime = 600
# maxretry = 3

# [sshd]
# enabled = true
# port = ssh
# filter = sshd
# logpath = /var/log/secure
# maxretry = 3
# EOF

# systemctl enable fail2ban
# systemctl start fail2ban

# Install CloudWatch agent (optional, for monitoring)
# dnf install -y amazon-cloudwatch-agent

# Log the completion
# echo "Bastion host setup completed at $(date)" >> /var/log/bastion-setup.log

# Test SSH service
if systemctl is-active --quiet sshd; then
    echo "$(date): SSH service is running" >> /var/log/ec2-ssh-setup.log
else
    echo "$(date): ERROR - SSH service failed to start" >> /var/log/ec2-ssh-setup.log
    systemctl status sshd >> /var/log/ec2-ssh-setup.log
fi