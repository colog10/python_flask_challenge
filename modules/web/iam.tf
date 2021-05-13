data "aws_iam_policy_document" "ecs_service" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_service" {
  name               = "${var.service_name}_ecs_role"
  assume_role_policy = data.aws_iam_policy_document.ecs_service.json
}


data "aws_iam_policy_document" "ecs_policy" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:Describe*",
      "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
      "elasticloadbalancing:DeregisterTargets",
      "elasticloadbalancing:Describe*",
      "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
      "elasticloadbalancing:RegisterTargets"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "ecs_service" {
  name   = "${var.service_name}_ecs_policy"
  role   = aws_iam_role.ecs_service.name
  policy = data.aws_iam_policy_document.ecs_policy.json
}

