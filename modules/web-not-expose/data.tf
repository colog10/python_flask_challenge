data "aws_caller_identity" "current" {}

data "template_file" "ecs_task_template" {
  template = file(var.ecs_template_file)

  vars = merge(local.default_template_vars, var.template_vars)
}

data "aws_alb" "alb" {
  name = var.alb_name
}
