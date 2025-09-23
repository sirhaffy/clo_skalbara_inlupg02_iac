# EC2 instances for Docker Swarm

# Docker Swarm Manager (in private subnet)
resource "aws_instance" "swarm_manager" {
  count = 1  # Single manager for simplicity (can be increased for HA)

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.small"
  key_name              = var.ssh_key_name
  subnet_id             = var.private_subnets[0]
  vpc_security_group_ids = [var.web_sg_id]

  tags = {
    Name        = "${var.project_name}-swarm-manager-${count.index + 1}"
    Environment = var.environment
    Role        = "swarm-manager"
    Type        = "docker-swarm"
  }
}

# Docker Swarm Workers (in private subnet)
resource "aws_instance" "swarm_worker" {
  count = 2  # TODO: Dynamical scling via ASG.

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.small"
  key_name              = var.ssh_key_name
  subnet_id             = var.private_subnets[count.index % length(var.private_subnets)]
  vpc_security_group_ids = [var.web_sg_id]

  tags = {
    Name        = "${var.project_name}-swarm-worker-${count.index + 1}"
    Environment = var.environment
    Role        = "swarm-worker"
    Type        = "docker-swarm"
  }
}

# Get latest Amazon Linux 2023 AMI
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

# Application Load Balancer
resource "aws_lb" "web_alb" {
  name               = "${var.project_name}-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name        = "${var.project_name}-web-alb"
    Environment = var.environment
  }
}

# Target Group for Docker Swarm
resource "aws_lb_target_group" "web_tg" {
  name     = "${var.project_name}-web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "${var.project_name}-web-tg"
    Environment = var.environment
  }
}

# ALB Listener
resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

# Attach instances to target group
resource "aws_lb_target_group_attachment" "web_tg_attachment" {
  count            = length(aws_instance.swarm_worker)
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.swarm_worker[count.index].id
  port             = 80
}