resource "aws_iam_policy" "default" {
  name   = "${var.name}"
  policy = "${var.policy}"
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "${var.role_name}"
  policy_arn = "${aws_iam_policy.default.arn}"
}