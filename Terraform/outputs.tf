# The main files outputs to be used by other modules or for information to the user
output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id # Example, Received from the networking modules output.
}

output "swarm_manager_ips" {
  description = "Docker Swarm manager private IPs"
  value       = module.docker_swarm.swarm_manager_private_ips
}

output "swarm_worker_ips" {
  description = "Docker Swarm worker private IPs"
  value       = module.docker_swarm.swarm_worker_private_ips
}

output "s3_bucket_name" {
  description = "S3 bucket name (if created)"
  value       = module.storage.bucket_name
}

# Lambda API outputs
output "api_gateway_url" {
  description = "URL of the API Gateway"
  value       = module.lambda.api_gateway_url
}

# Store API Gateway URL in SSM Parameter Store for fallback access
resource "aws_ssm_parameter" "api_gateway_url" {
  name        = "/app/api-gateway-url"
  description = "API Gateway URL for the application"
  type        = "String"
  value       = module.lambda.api_gateway_url

  tags = {
    Name        = "API Gateway URL"
    Environment = var.environment
    Project     = "clo-skalbara-upg02"
  }
}

output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = module.lambda.lambda_function_name
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = module.lambda.ecr_repository_url
}

output "github_actions_user" {
  description = "GitHub Actions IAM user name"
  value       = module.lambda.GH_ACTIONS_USER_NAME
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.docker_swarm.alb_dns_name
}

output "bastion_public_ip" {
  description = "Public IP address of the bastion host"
  value       = module.bastion.bastion_public_ip
}

output "bastion_ssh_command" {
  description = "SSH command to connect to bastion host"
  value       = module.bastion.ssh_command
}

output "bastion_public_dns" {
  description = "Public DNS name of the bastion host"
  value       = module.bastion.bastion_public_dns
}

output "manager_private_ip" {
  description = "Private IP of the first manager node"
  value       = length(module.docker_swarm.swarm_manager_private_ips) > 0 ? module.docker_swarm.swarm_manager_private_ips[0] : null
}

output "worker1_private_ip" {
  description = "Private IP of the first worker node"
  value       = length(module.docker_swarm.swarm_worker_private_ips) > 0 ? module.docker_swarm.swarm_worker_private_ips[0] : null
}

output "worker2_private_ip" {
  description = "Private IP of the second worker node"
  value       = length(module.docker_swarm.swarm_worker_private_ips) > 1 ? module.docker_swarm.swarm_worker_private_ips[1] : null
}

# Trigger
