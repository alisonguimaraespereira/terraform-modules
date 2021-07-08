resource "aws_elb" "default_elb" {
  name                        = "${var.elb_name}"
  subnets                     = "${var.subnets_ids}"
  security_groups             = ["${var.security_groups}"]
  internal                    = "${var.internal}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"
  #instances                   = ["${var.ec2_instance_id}"]
  availability_zones          = data.aws_availability_zones.all.names

  listener {
    instance_port     = "${var.application_port_instance}"
    instance_protocol = "${var.application_protocol_instance}"
    lb_port           = "${var.application_port_lb}"
    lb_protocol       = "${var.application_protocol_lb}"
    #If https is seletected
    #ssl_certificate_id = "${var.ssl_arn}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "${var.application_protocol_instance}:${var.application_port_instance}"
    interval            = 6
  }
  access_logs  {
    bucket = "${var.bucket-log-elb}"
    bucket_prefix = "logs"
  }

}
