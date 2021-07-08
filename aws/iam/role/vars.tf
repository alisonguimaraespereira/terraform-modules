variable "name" {
    description = "Nome da função"
}

variable "path_role" {
    description = "Path do Policy.json"
}

variable "aws_account_id" {
    description = "AWS ID BU Account"
}

variable "policy_names" {
  description = "Policies used on IAM Role creation"
  type        = list(string)
}