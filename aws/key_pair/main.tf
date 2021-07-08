resource "aws_key_pair" "default" {
  key_name   = "${var.aws_key_pair_name}"
  public_key = "${var.key_pub}"

  provisioner "local-exec" { 
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./Key.pem"
  }
}