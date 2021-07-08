
variable "elb_name" {}

variable "subnets_ids" {
  default = []
}
variable "security_groups" {
  default = []
}
variable "internal" {}

variable "idle_timeout" {}

variable "connection_draining" {
  description = "true or false"
}

variable "connection_draining_timeout" {
  default = 300
}

#variable "ec2_instance_id" {
#  default = []
##  description = "Id Instance created in plan"
#}
variable "application_port_instance" {
  description = "Instance Port Application"
}

variable "application_protocol_instance" {
  description = "Instance Port Application modes: TCP, http, https"
}

variable "application_port_lb" {
  description = "lb Port Application"
}

variable "application_protocol_lb" {
  description = "lb Port Application modes: TCP, http, https"
}
#variable "ssl_arn" {}

variable "bucket-log-elb" {
  description = "Name of bucket to store logs"
}













