variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "web_sg_id" {
  description = "Web security group ID"
  type        = string
}

variable "alb_sg_id" {
  description = "ALB security group ID"
  type        = string
}

variable "ssh_key_name" {
  description = "SSH key pair name"
  type        = string
}