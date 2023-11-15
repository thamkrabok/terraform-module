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
    env         = "dev"
    eks_name    = "demo"
    subnet_ids      = ["subnet-0e00c5227cb7daaad","subnet-0d0d07080c562e554"]

    node_groups = {
        general = {
            capacity_type    = "ON_DEMAND"
            instance_types   = ["t3.medium"]
            scaling_config   = {
                desired_size = 1
                max_size     = 10
                min_size     = 0
            }
        }
    }
    # node_groups = {
    #     scaling_config   = {
    #         desired_size = 1
    #         max_size     = 10
    #         min_size     = 0
    #     }

    #     capacity_type    = "ON_DEMAND"
    #     instance_types   = ["t3.medium"]
    # }
}

