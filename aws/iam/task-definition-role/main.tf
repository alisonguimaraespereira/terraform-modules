resource "aws_iam_role" "default" {
  name               = "${var.name}"
  assume_role_policy = "${var.assume_role_policy}"
}

