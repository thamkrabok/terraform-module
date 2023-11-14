provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "remote" {
    hostname =  "app.terraform.io"
    organization = "beleiftfeks"

    workspaces {
        name = terraform-module-staging
    }
  }
}

module "vpc" {
  source = "../../../modules/vpc"

  env = "staging"
  azs = ["ap-southeast-1a","ap-southeast-1b"]
  private_subnets = ["10.35.0.0/19", "10.35.32.0/19"]
  public_subnets = ["10.35.64.0/19", "10.35.96.0/19"]

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/staging-demo" = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
    "kubernetes.io/cluster/staging-demo" = "owned"
  }  
}
