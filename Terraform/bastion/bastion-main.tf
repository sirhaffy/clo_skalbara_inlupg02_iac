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

# Bastion Host EC2 Instance
resource "aws_instance" "bastion" {
  ami                        = data.aws_ami.amazon_linux.id
  instance_type              = "t3.small"
  key_name                   = var.ssh_key_name
  vpc_security_group_ids     = [var.bastion_sg_id]
  subnet_id                  = var.public_subnet_id
  associate_public_ip_address = true

  # User data script to set up SSH
  user_data = base64encode(templatefile("${path.module}/user-data/ssh-setup.sh", {
    # Add variables to pass to the script if needed..
  }))

  # Force recreation when user_data changes
  lifecycle {
    replace_triggered_by = [
      terraform_data.swarm_user_data_trigger
    ]
  }

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