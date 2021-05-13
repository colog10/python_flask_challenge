# security groups
resource "aws_security_group" "sg" {
  description = "${var.cluster_name}-ecs-sg"
  name_prefix = format("%s-", "${var.cluster_name}-ecs-sg")
  vpc_id      = var.vpc_id

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

# security group rules
resource "aws_security_group_rule" "sg_rule_vpc_ing" {
  type        = "ingress"
  from_port   = "0"
  to_port     = "0"
  protocol    = "-1"
  cidr_blocks = [var.vpc_cidr]
  description = "allow HTTPS from cidr block"

  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "sg_rule_all_ing" {
  type        = "ingress"
  from_port   = "22"
  to_port     = "22"
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"] 
  description = "allow SSH"

  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "sg_rule_vpc_eg" {
  type        = "egress"
  from_port   = "0"
  to_port     = "0"
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  description = "allow all trafic to anywhere"

  security_group_id = aws_security_group.sg.id
}
