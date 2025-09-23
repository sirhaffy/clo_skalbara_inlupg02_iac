output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = var.environment == "prod" ? aws_s3_bucket.app_bucket[0].bucket : null
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = var.environment == "prod" ? aws_s3_bucket.app_bucket[0].arn : null
}