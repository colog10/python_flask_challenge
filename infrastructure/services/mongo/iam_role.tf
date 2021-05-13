resource "aws_iam_role" "service_role" {
  name               = "${local.service_name}_${local.environment}_service_role"
  assume_role_policy = data.aws_iam_policy_document.ecs-task.json
}

data "aws_iam_policy_document" "ecs-task" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}