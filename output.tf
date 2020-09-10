output "iam_user" {
  value = aws_iam_user.iam_user
  description = "IAM User Object"
}

output "iam_user_arn" {
  value = aws_iam_user.iam_user.arn
  description = "The IAM User's ARN"
}

output "secret_aws_access_key_id" {
  value = module.secret_aws_access_key_id.secret
  description = "The AWS Access ID"
}

output "secret_aws_secret_access_key" {
  value = module.secret_aws_secret_access_key.secret
  description = "The AWS Secret Access Key"
}

