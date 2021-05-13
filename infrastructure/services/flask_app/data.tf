data "aws_vpc" "default" {
  default = true
}

data "aws_instance" "ecs_instance" {
  filter {
    name   = "tag:terraform"
    values = ["true"]
  }
}