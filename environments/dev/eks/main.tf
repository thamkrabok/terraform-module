provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "remote" {
    hostname =  "app.terraform.io"
    organization = "beleiftfeks"

    workspaces {
        name = terraform-module-dev
    }
  }
}

module "eks" {
    source = "../../../modules/eks"
    eks_version = "1.26"
    env         = include.env.locals.env
    eks_name    = "demo"
    subnet      = output.private_subnet_ids

    node_groups = {
        desired_size = 1
        max_size     = 10
        min_size     = 0

        capacity_type    = "ON_DEMAND"
        instance_types   = ["t3.medium"]
    }

    tags = var.tags
}

