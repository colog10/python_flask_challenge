module "ecs" {
  source             = "../modules/ecs"
  cluster_name       = "${local.project}-${local.environment}"
  vpc_id             = data.aws_vpc.default.id
  max_size           = local.ecs_max_size
  min_size           = local.ecs_min_size
  desired_size       = local.ecs_desired_size
  instance_type      = local.ecs_instance_type
  vpc_cidr           = data.aws_vpc.default.cidr_block
  key_name           = aws_key_pair.admin.key_name
  vpc_subnets        = [element(tolist(data.aws_subnet_ids.default.ids),0), element(tolist(data.aws_subnet_ids.default.ids),1)]
  container_insights = true
  public_ip          = true
  user_data          = data.template_file.user_data.rendered
}

resource "aws_key_pair" "admin" {
  key_name   = local.project
  public_key = local.ec2_public_key
}

data "template_file" "user_data" {
  template = file("user-data.yaml")
  vars = {
    cluster_name = "${local.project}-${local.environment}"
  }
}