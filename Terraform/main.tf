# Networking Module
module "networking" {
  source = "./networking"

  # Variables that are passed to the module
  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr            = var.vpc_cidr
}

# Security Module
module "security" {
  source = "./security"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.networking.vpc_id
  vpc_cidr     = module.networking.vpc_cidr
  ssh_key_name = var.ssh_key_name
}

# Storage Module (S3) for Terraform state
module "storage" {
  source = "./storage"

  project_name = var.project_name
  environment  = var.environment
}

# Docker Swarm Module (EC2/ALB)
module "docker_swarm" {
  source = "./docker_swarm"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id           = module.networking.vpc_id
  public_subnets   = module.networking.public_subnet_ids
  private_subnets  = module.networking.private_subnet_ids
  web_sg_id        = module.security.web_sg_id
  alb_sg_id        = module.security.alb_sg_id
  ssh_key_name     = var.ssh_key_name
}

# Lambda Module (API + DynamoDB)
module "lambda" {
  source = "./lambda"

  project_name              = var.project_name
  environment              = var.environment
  GH_ACTIONS_USER_NAME = var.GH_ACTIONS_USER_NAME
}