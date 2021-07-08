output "elb_name" {
  value = "${aws_elb.default_elb.name}"
}

output "dns_name" {
  value = "${aws_elb.default_elb.dns_name}"
}
output "elb_id" {
  description = "The id of the ELB"
  value       = "${aws_elb.default_elb.id}"
}