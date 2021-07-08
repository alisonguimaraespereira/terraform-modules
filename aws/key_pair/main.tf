resource "aws_key_pair" "default" {
  key_name   = "${var.aws_key_pair_name}"
  public_key = "${var.key_pub}"
}