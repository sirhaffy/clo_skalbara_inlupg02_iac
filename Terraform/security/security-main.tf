# Security Groups for the infrastructure

# Web Security Group - For EC2 instances running Docker Swarm
resource "aws_security_group" "web_sg" {
  name_prefix = "${var.project_name}-web-sg"
  description = "Security group for web servers (Docker Swarm)"
  vpc_id      = var.vpc_id

  # HTTP access from ALB only
  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  # SSH access for administration (restrict to your IP in production)
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # TODO: Restrict to your IP
  }

  # Docker Swarm manager port (internal communication)
  ingress {
    description = "Docker Swarm Manager"
    from_port   = 2377
    to_port     = 2377
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  # Docker Swarm communication (internal)
  ingress {
    description = "Docker Swarm Communication"
    from_port   = 7946
    to_port     = 7946
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "Docker Swarm Communication UDP"
    from_port   = 7946
    to_port     = 7946
    protocol    = "udp"
    cidr_blocks = [var.vpc_cidr]
  }

  # Docker overlay network
  ingress {
    description = "Docker Overlay Network"
    from_port   = 4789
    to_port     = 4789
    protocol    = "udp"
    cidr_blocks = [var.vpc_cidr]
  }

  # All outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-web-sg"
    Environment = var.environment
    Purpose     = "Docker Swarm Web Security Group"
  }
}

# ALB Security Group - For Application Load Balancer
resource "aws_security_group" "alb_sg" {
  name_prefix = "${var.project_name}-alb-sg"
  description = "Security group for Application Load Balancer"
  vpc_id      = var.vpc_id

  # HTTP access from internet
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # All outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-alb-sg"
    Environment = var.environment
    Purpose     = "Application Load Balancer Security Group"
  }
}
