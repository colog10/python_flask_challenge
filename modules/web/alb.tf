resource "aws_alb_target_group" "alb_tg" {
  name                 = "${var.service_name}-TG"
  port                 = var.container_port
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  deregistration_delay = var.deregistration_delay

  health_check {
    interval            = var.interval
    path                = var.health_check
    timeout             = var.timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    matcher             = var.health_check_status
  }

  tags = var.tags
}

resource "aws_lb_listener" "listener80" {
  load_balancer_arn = data.aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.alb_tg.arn
    type             = "forward"
  }
}
