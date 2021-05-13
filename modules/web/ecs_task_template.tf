locals {
  default_template_vars = {
    min_memory         = var.min_memory
    max_memory         = var.max_memory
    app_port_number    = var.container_port
    app_port_protocol  = var.protocol
    host_name          = var.service_name
    container_name     = var.service_name
    ecr_repo           = "${var.ecr_repo}:${var.image_version}"
    run_command        = var.run_command
    cpu_units          = var.cpu_units
    logs_group         = aws_cloudwatch_log_group.cloudwatch_logs.name
    logs_region        = var.logs_region
    logs_stream_prefix = var.service_name
    family             = var.service_name
  }
}

