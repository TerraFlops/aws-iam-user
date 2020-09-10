resource "aws_iam_user" "iam_user" {
  path = var.path
  name = var.username
  tags = {
    Name = var.username
    Description = var.description
  }
}

resource "aws_iam_user_policy" "iam_user_policies" {
  for_each = var.policies
  name = each.key
  user = aws_iam_user.iam_user.name
  policy = each.value
}

resource "aws_iam_access_key" "iam_user_access_key" {
  user = aws_iam_user.iam_user.name
}

module "secret_aws_access_key_id" {
  source = "git::https://github.com/TerraFlops/aws-secrets-manager-secret?ref=v1.0"

  path = "/credentials/iam_user/${aws_iam_user.iam_user.name}/aws_access_key_id"
  value = aws_iam_access_key.iam_user_access_key.id
  description = "IAM user AWS access key ID"
}

module "secret_aws_secret_access_key" {
  source = "git::https://github.com/TerraFlops/aws-secrets-manager-secret?ref=v1.0"

  path = "/credentials/iam_user/${aws_iam_user.iam_user.name}/aws_secret_access_key"
  value = aws_iam_access_key.iam_user_access_key.secret
  description = "IAM user AWS secret access key"
}
