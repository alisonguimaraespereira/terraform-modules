resource "aws_autoscaling_group" "default_asg" {
  availability_zones        = data.aws_availability_zones.all.names
  count                     = var.associate_elb == "EC2" ? 1 : 0
  name                      = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  launch_configuration      = var.lc_name
  vpc_zone_identifier       = var.subnets_id

  tags = [{
    key                 = "Name"
    value               = var.tag_name
    propagate_at_launch = true
    },
    {
    key                 = "BU"
    value               = var.tag_bu
    propagate_at_launch = true
  }]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "default_asg_elb" {
  count                     = var.associate_elb == "ELB" ? 1 : 0
  health_check_type         = var.health_check_type
  name                      = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  desired_capacity          = var.desired_capacity
  launch_configuration      = var.lc_name
  vpc_zone_identifier       = var.subnets_id

  load_balancers = var.load_balancer

  tags = [{
    key                 = "Name"
    value               = var.tag_name
    propagate_at_launch = true
    },
    {
      key                 = "BU"
      value               = var.tag_bu
      propagate_at_launch = true
    },
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "default_asg_tg" {
  count                     = var.associate_elb == "TG" ? 1 : 0
  name                      = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 300
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  launch_configuration      = var.lc_name
  vpc_zone_identifier       = var.subnets_id
  target_group_arns         = var.target_group_arns

  tags = [{
    key                 = "Name"
    value               = var.tag_name
    propagate_at_launch = true
  },
  {
    key                 = "bu"
    value               = var.tag_bu
    propagate_at_launch = true
  }]

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_policy" "default_asg_policy" {
  count                  = var.associate_elb == "TG" ? 1 : 0
  name                   = "default-asg-policy"
  # scaling_adjustment     = 2
  adjustment_type        = "ChangeInCapacity"
  # cooldown               = 180
  autoscaling_group_name = var.asg_name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 70.0
  }
  depends_on = [aws_autoscaling_group.default_asg_tg]
}
