# Data source to get the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Bastion Host EC2 Instance
resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type              = "t2.micro"  # Free tier eligible
  key_name                   = var.ssh_key_name
  vpc_security_group_ids     = [var.bastion_sg_id]
  subnet_id                  = var.public_subnet_id
  associate_public_ip_address = true

  # No user_data - let Ansible handle all configuration

  tags = {
    Name        = "${var.project_name}-${var.environment}-bastion"
    Environment = var.environment
    Project     = var.project_name
    Type        = "bastion"
    Role        = "bastion"  # For Ansible targeting
  }

  # Ensure we have a stable hostname
  private_dns_name_options {
    enable_resource_name_dns_a_record = true
  }
}

# Elastic IP for bastion (optional but recommended for consistent access)
resource "aws_eip" "bastion" {
  instance = aws_instance.bastion.id
  domain   = "vpc"

  tags = {
    Name        = "${var.project_name}-${var.environment}-bastion-eip"
    Environment = var.environment
    Project     = var.project_name
  }

  depends_on = [aws_instance.bastion]
}