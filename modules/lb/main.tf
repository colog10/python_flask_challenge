resource "aws_lb" "alb" {
  name = var.name

  internal                         = var.is_internal
  security_groups                  = [var.alb_sg]
  subnets                          = var.subnets_id
  enable_deletion_protection       = var.delete_protection
  enable_cross_zone_load_balancing = var.cross_zone_lb
  idle_timeout                     = var.idle_timeout

  access_logs {
    bucket  = aws_s3_bucket.alb_logs.id
    enabled = true
    prefix  = "${var.name}-alb"
  }

  tags = var.tags
}