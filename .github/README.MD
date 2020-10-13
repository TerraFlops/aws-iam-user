# Terraflops Terraform Module
 
### AWS IAM User

Terraform Module for creation of AWS IAM Users.

This module will also manage the IAM User credentials.
#### Example usage

```hcl-terraform
module "iam_user" {
  source = "git::https://github.com/TerraFlops/aws-iam-user?ref=v1.0"
  username = "example-user"
  path = "/"
  policies = {
    aws-read-only = data.aws_iam_policy_document.aws-read-only.json
  }
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | IAM user description | `string` | n/a | yes |
| path | IAM user path | `string` | `"/"` | no |
| policies | Map of inline policies to attach to the IAM user | `map(string)` | n/a | yes |
| username | IAM user username | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| iam\_user | IAM User Object |
| iam\_user\_arn | The IAM User's ARN |
| secret\_aws\_access\_key\_id | The AWS Access ID |
| secret\_aws\_secret\_access\_key | The AWS Secret Access Key |

