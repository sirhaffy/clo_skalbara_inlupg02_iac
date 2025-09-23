output "web_sg_id" {
  description = "ID of the web security group"
  value       = aws_security_group.web_sg.id
}

output "web_sg_name" {
  description = "Name of the web security group"
  value       = aws_security_group.web_sg.name
}

output "alb_sg_id" {
  description = "ID of the ALB security group"
  value       = aws_security_group.alb_sg.id
}

output "alb_sg_name" {
  description = "Name of the ALB security group"
  value       = aws_security_group.alb_sg.name
}