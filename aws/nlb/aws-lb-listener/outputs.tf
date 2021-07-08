output "arn_https" {
  value = element(concat(aws_lb_listener.TLS.*.arn, tolist([""])), 0)
}

output "arn_http" {
  value = element(concat(aws_lb_listener.TCP.*.arn, tolist([""])), 0)
}
