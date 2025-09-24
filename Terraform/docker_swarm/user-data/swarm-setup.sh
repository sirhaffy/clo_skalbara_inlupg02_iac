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

# Start and enable Docker service
echo "$(date): Starting and enabling Docker service"
systemctl enable docker
systemctl start docker

# Add ec2-user to docker group
echo "$(date): Adding ec2-user to docker group"
usermod -a -G docker ec2-user

# Wait for Docker to be fully ready
sleep 10

# Install Docker Compose for easier container management
echo "$(date): Installing Docker Compose"
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Simple web application setup (instead of complex Swarm)
echo "$(date): Setting up simple web application"
mkdir -p /opt/webapp
cat > /opt/webapp/docker-compose.yml << 'EOF'
version: '3.8'
services:
  web:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./html:/usr/share/nginx/html:ro
    restart: unless-stopped
EOF

# Create simple HTML page
mkdir -p /opt/webapp/html
cat > /opt/webapp/html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Scalable Web Application</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f0f0f0; }
        .container { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; }
        .info { background: #e8f4f8; padding: 15px; border-radius: 5px; margin: 20px 0; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Scalable Web Application</h1>
        <div class="info">
            <h3>Application Info</h3>
            <p><strong>Instance:</strong> $(hostname)</p>
            <p><strong>Status:</strong> Running</p>
            <p><strong>Deployed:</strong> $(date)</p>
        </div>
        <p>This is a simplified, highly available web application running on AWS infrastructure.</p>
        <p>✅ Infrastructure as Code with Terraform</p>
        <p>✅ Load Balanced with ALB</p>
        <p>✅ Auto-deployed with GitHub Actions</p>
    </div>
</body>
</html>
EOF

# Replace hostname and date placeholders
sed -i "s/\$(hostname)/$(hostname)/g" /opt/webapp/html/index.html
sed -i "s/\$(date)/$(date)/g" /opt/webapp/html/index.html

# Start the web application
echo "$(date): Starting web application"
cd /opt/webapp
/usr/local/bin/docker-compose up -d

# Test services
echo "$(date): Final service status checks"
systemctl status sshd
systemctl status docker
docker ps

echo "$(date): Docker Swarm node user-data script completed successfully"

# Test Docker installation
echo "$(date): Docker version check"
docker --version

echo "$(date): Docker Swarm node user-data script completed"