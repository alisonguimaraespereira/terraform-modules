variable "load_balancer_arn" {}

variable "port" {
  default = 80
}

variable "protocol" {
  default = "HTTP"
}

#variable "ssl_certificate" {}

#variable "certificate_arn" {}

variable "type" {
  default = "forward"
}

variable "target_group_arn" {}
