output "swarm_manager_private_ips" {
  description = "Private IP addresses of Swarm manager nodes"
  value       = aws_instance.swarm_manager[*].private_ip
}

output "swarm_worker_private_ips" {
  description = "Private IP addresses of Swarm worker nodes"
  value       = aws_instance.swarm_worker[*].private_ip
}

output "swarm_manager_instance_ids" {
  description = "Instance IDs of Swarm manager nodes"
  value       = aws_instance.swarm_manager[*].id
}

output "swarm_worker_instance_ids" {
  description = "Instance IDs of Swarm worker nodes"
  value       = aws_instance.swarm_worker[*].id
}

# For Ansible inventory generation
output "all_instance_ips" {
  description = "All instance private IPs for Ansible inventory"
  value = {
    managers = aws_instance.swarm_manager[*].private_ip
    workers  = aws_instance.swarm_worker[*].private_ip
  }
}

# ALB outputs
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.web_alb.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the Application Load Balancer"
  value       = aws_lb.web_alb.zone_id
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.web_alb.arn
}