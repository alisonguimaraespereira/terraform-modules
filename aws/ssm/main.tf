resource "aws_ssm_parameter" "secret" {
  name        = "/${var.name}"
  description = "${var.description}"
  type        = "${var.type}"
  value       = "${var.value}"

  tags = {
    Team = "${var.team}"
  }
}
