module "mongo" {
  source            = "../../../modules/web-not-expose"
  vpc_id            = data.aws_vpc.default.id
  ecs_cluster_name  = local.cluster_name
  ecs_template_file = var.ecs_web_template_file
  image_version     = var.image_version
  logs_region       = local.region
  container_port    = local.container_port
  health_check      = local.health_check
  alb_name          = local.alb_name
  ecr_repo          = "mongo"
  desired_count     = 1
  task_role_arn     = aws_iam_role.service_role.arn
  cpu_units         = 512
  max_memory        = 512
  min_memory        = 256
  service_name      = local.service_name
}
