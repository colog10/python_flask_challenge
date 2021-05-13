resource "aws_security_group" "alb" {
  name_prefix = "${local.project}-${local.environment}-alb"
  vpc_id      = data.aws_vpc.default.id

  tags = merge(local.tags, {
    related_with = "alb.${local.project}-${local.environment}"
  })

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http traffic from anywhere"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow outgoing traffic"
  }
}

module "lb" {
  source           = "../modules/lb"
  name             = "${local.project}-${local.environment}"
  subnets_id       = [element(tolist(data.aws_subnet_ids.default.ids),0), element(tolist(data.aws_subnet_ids.default.ids),1)]
  vpc_id           = data.aws_vpc.default.id
  alb_sg           = aws_security_group.alb.id
}

output "alb_dns_name" {
  value = module.lb.alb_dns_name
}