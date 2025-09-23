variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "github_actions_user_name" {
  description = "Name of your existing GitHub Actions IAM user"
  type        = string
  default     = "github-actions-user"  # Matchar din befintliga användare
}

variable "lambda_timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 30
}

variable "lambda_memory_size" {
  description = "Lambda function memory size in MB"
  type        = number
  default     = 128  # Free tier: up to 128MB
}