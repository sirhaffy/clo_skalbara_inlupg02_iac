# S3 bucket for tferraform state
resource "aws_s3_bucket" "app_bucket" {
  count = var.environment == "prod" ? 1 : 0

  bucket        = "${var.project_name}-app-storage"
  force_destroy = false  # Protect production data

  tags = {
    Name        = "${var.project_name}-app-storage"
    Environment = var.environment
    Purpose     = "Application file storage"
  }
}

resource "aws_s3_bucket_versioning" "app_bucket" {
  count = var.environment == "prod" ? 1 : 0

  bucket = aws_s3_bucket.app_bucket[0].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "app_bucket" {
  count = var.environment == "prod" ? 1 : 0

  bucket = aws_s3_bucket.app_bucket[0].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "app_bucket" {
  count = var.environment == "prod" ? 1 : 0

  bucket = aws_s3_bucket.app_bucket[0].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}