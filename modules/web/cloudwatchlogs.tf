resource "aws_cloudwatch_log_group" "cloudwatch_logs" {
  name              = var.service_name
  retention_in_days = var.log_retention

  tags = var.tags
}

