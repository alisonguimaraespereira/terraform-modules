variable "name" {
  description = "String to be used as the name of the AWS ssm"
}

variable "description" {
  description = "The description of the aws resource"
}

variable "value" {
  description = "The value to be stored"
}

variable "type" {
  description = "The type of ssm 'SecureString' for example"
}

variable "team" {
  description = "The team to be tagged as owner in aws account"
}
