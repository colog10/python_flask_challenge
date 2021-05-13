locals {
  region         = "us-east-1"
  environment    = "test"
  service_name   = "flask"
  cluster_name   = "flask-chllge-test"
  container_port = "5000"
  health_check   = "/"
  alb_name       = "flask-chllge-test"
  tags = {
    terraform = true
  }
}

