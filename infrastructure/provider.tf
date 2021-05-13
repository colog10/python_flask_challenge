provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

terraform {
  required_version = ">= 0.13.7"

  required_providers {
    aws    = "~> 3.15"
  }
}