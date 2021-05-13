locals {
  region         = "us-east-1"
  environment    = "test"
  service_name   = "mongo"
  cluster_name   = "flask-chllge-test"
  container_port = "27017"
  health_check   = "/"
  alb_name       = "flask-chllge-test"
  tags = {
    terraform = true
  }
}

