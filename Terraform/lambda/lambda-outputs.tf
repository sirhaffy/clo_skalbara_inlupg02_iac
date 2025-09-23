output "api_gateway_url" {
  description = "API Gateway URL for making requests"
  value       = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${data.aws_region.current.name}.amazonaws.com/prod"
}

output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.api_lambda.function_name
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.items.name
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.api_lambda.repository_url
}

output "GH_ACTIONS_USER_NAME" {
  description = "GitHub Actions IAM user name (existing)"
  value       = data.aws_iam_user.github_actions.user_name
}

output "cloudwatch_log_group" {
  description = "CloudWatch log group for Lambda"
  value       = aws_cloudwatch_log_group.lambda_logs.name
}