resource "aws_launch_configuration" "asg_lc" {
  name_prefix                 = "ecs-${var.cluster_name}"
  image_id                    = data.aws_ami.ecs_ami.id
  associate_public_ip_address = var.public_ip
  ebs_optimized               = "false"
  enable_monitoring           = var.enable_monitoring
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  instance_type               = var.instance_type
  key_name                    = var.key_name
  placement_tenancy           = "default"
  security_groups             = [aws_security_group.sg.id]
  user_data = var.user_data
  root_block_device {
    volume_size = length(var.root_vol_size) > 0 ? var.root_vol_size : "30"
    volume_type = "gp2"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier       = var.vpc_subnets
  name                      = "ecs-${var.cluster_name}"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 100
  default_cooldown          = var.cooldown
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_size
  force_delete              = true
  launch_configuration      = aws_launch_configuration.asg_lc.name

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  timeouts {
    delete = "15m"
  }
}

