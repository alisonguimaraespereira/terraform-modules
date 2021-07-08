output "nlb_arn" {
  value = var.internal ? concat(aws_lb.nlb_internal.*.arn, tolist([""]))[0] : concat(aws_lb.nlb_external.*.arn, tolist([""]))[0]
}

output "dns_name" {
  value = var.internal ? concat(aws_lb.nlb_internal.*.dns_name, tolist([""]))[0] : concat(aws_lb.nlb_external.*.dns_name, tolist([""]))[0]
}
