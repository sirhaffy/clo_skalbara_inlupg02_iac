data "aws_ami" "amazon_linux" { # Data source to get the latest Amazon Linux 2023 AMI
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

# IAM Role for Bastion Host to access SSM Parameter Store
resource "aws_iam_role" "bastion_role" {
  name = "${var.project_name}-${var.environment}-bastion-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name        = "${var.project_name}-${var.environment}-bastion-role"
    Environment = var.environment
    Project     = var.project_name
  }
}

# IAM Policy for accessing SSH key from SSM Parameter Store
resource "aws_iam_role_policy" "bastion_ssm_policy" {
  name = "${var.project_name}-${var.environment}-bastion-ssm-policy"
  role = aws_iam_role.bastion_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm:GetParameter",
          "ssm:GetParameters"
        ]
        Resource = "arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter/ssh/clo_ec2_001"
      }
    ]
  })
}

# Instance Profile for the Bastion Host
resource "aws_iam_instance_profile" "bastion_profile" {
  name = "${var.project_name}-${var.environment}-bastion-profile"
  role = aws_iam_role.bastion_role.name

  tags = {
    Name        = "${var.project_name}-${var.environment}-bastion-profile"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Data sources for current region and account
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

# Bastion Host EC2 Instance
resource "aws_instance" "bastion" {
  ami                        = data.aws_ami.amazon_linux.id
  instance_type              = "t3.small"
  key_name                   = var.ssh_key_name
  vpc_security_group_ids     = [var.bastion_sg_id]
  subnet_id                  = var.public_subnet_id
  associate_public_ip_address = true
  iam_instance_profile       = aws_iam_instance_profile.bastion_profile.name

  # User data script to set up SSH and retrieve private key
  user_data = base64encode(templatefile("${path.module}/user-data/ssh-setup.sh", {
    project_name = var.project_name
    environment  = var.environment
  }))

  # Ensure user data runs completely
  user_data_replace_on_change = true

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

# Elastic IP for bastion
resource "aws_eip" "bastion" {
  domain = "vpc"

  tags = {
    Name        = "${var.project_name}-${var.environment}-bastion-eip"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Explicit EIP association to ensure it's attached correctly
resource "aws_eip_association" "bastion" {
  instance_id   = aws_instance.bastion.id
  allocation_id = aws_eip.bastion.id

  depends_on = [aws_instance.bastion, aws_eip.bastion]
}