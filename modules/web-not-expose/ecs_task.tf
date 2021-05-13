resource "aws_ecs_task_definition" "ecs_task" {
  family                = var.service_name
  container_definitions = data.template_file.ecs_task_template.rendered
  task_role_arn         = var.task_role_arn
}

resource "aws_ecs_service" "ecs_service" {
  name                               = var.service_name
  cluster                            = data.aws_ecs_cluster.ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.ecs_task.arn
  deployment_minimum_healthy_percent = 100
  desired_count                      = var.desired_count
}

