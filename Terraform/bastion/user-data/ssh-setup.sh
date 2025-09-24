#!/bin/bash

# Log all commands for debugging
exec > >(tee /var/log/user-data.log) 2>&1

dnf update -y
dnf install -y openssh-server openssh-clients aws-cli

# Ensure SSH service is enabled and started
systemctl enable sshd
systemctl start sshd

# Wait for instance to get IAM permissions (sometimes takes a moment)
echo "$(date): Waiting for IAM permissions to propagate..."
sleep 30

# Create SSH directory for ec2-user
echo "$(date): Setting up SSH directory for ec2-user"
mkdir -p /home/ec2-user/.ssh
chown ec2-user:ec2-user /home/ec2-user/.ssh
chmod 700 /home/ec2-user/.ssh

# Retrieve SSH private key from SSM Parameter Store
echo "$(date): Retrieving SSH private key from SSM Parameter Store"
if aws ssm get-parameter --name "/ssh/clo_ec2_001" --with-decryption --region $(curl -s http://169.254.169.254/latest/meta-data/placement/region) --query 'Parameter.Value' --output text > /home/ec2-user/.ssh/clo_ec2_001; then
    echo "$(date): Successfully retrieved SSH private key"

    # Set correct permissions on the private key
    chown ec2-user:ec2-user /home/ec2-user/.ssh/clo_ec2_001
    chmod 600 /home/ec2-user/.ssh/clo_ec2_001

    echo "$(date): SSH private key permissions set correctly"
else
    echo "$(date): ERROR: Failed to retrieve SSH private key from SSM Parameter Store"
fi

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

