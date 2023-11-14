resource "aws_vpc" "terragrunt" {
  cidr_block = "10.35.0.0/16"

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    "Name" = "staging"
    "Owner" = "vetuch.ta"
    "Project" = "TH.SE.DESIGN"
  }
}