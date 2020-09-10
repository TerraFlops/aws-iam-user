variable "username" {
  type = string
  description = "IAM user username"
}

variable "description" {
  type = string
  description = "IAM user description"
}

variable "policies" {
  type = map(string)
  description = "Map of inline policies to attach to the IAM user"
}

variable "path" {
  type = string
  default = "/"
  description = "IAM user path"
}
