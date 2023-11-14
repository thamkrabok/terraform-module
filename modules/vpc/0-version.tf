terraform {
    required_version = ">= 1.0"

    # backend "remote" {
    #   hostname =  "app.terraform.io"
    #   organization = "belieftfeks"

    #   workspaces {
    #     name = terraform-module-dev
    #   }
    # }

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.62"
      }
    }
}