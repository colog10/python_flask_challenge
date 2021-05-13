resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
  tags = var.tags

  setting {
    name  = "containerInsights"
    value = var.container_insights == false ? "disabled" : "enabled"
  }
}
