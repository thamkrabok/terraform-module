provider "aws" {
    region = "ap-southeast-1"
}

terraform {
    required_version = ">= 1.0"

    backend "remote" {
      hostname =  "app.terraform.io"
      organization = "Default Project"

      workspaces {
        prefix = terraform-eks-staging
      }
    }

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.62"
      }
    }
}
#test