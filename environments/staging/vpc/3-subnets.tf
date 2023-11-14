resource "aws_subnet" "private_terragrunt_1a" {
  vpc_id    =   aws_vpc.terragrunt.id
  cidr_block = "10.35.0.0/19"
  availability_zone = "ap-southeast-1a"

  tags =  {
    "Name" = "staging"
    "Owner" = "vetuch.ta"
    "Project" = "TH.SE.DESIGN"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/dev-demo" = "owned"
  }
}

resource "aws_subnet" "private_terragrunt_1b" {
  vpc_id    =   aws_vpc.terragrunt.id
  cidr_block = "10.35.32.0/19"
  availability_zone = "ap-southeast-1b"

  tags =  {
    "Name" = "staging"
    "Owner" = "vetuch.ta"
    "Project" = "TH.SE.DESIGN"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/dev-demo" = "owned"
  }
}

resource "aws_subnet" "public_terragrunt_1a" {
  vpc_id    =   aws_vpc.terragrunt.id
  cidr_block = "10.35.64.0/19"
  availability_zone = "ap-southeast-1a"

  tags =  {
    "Name" = "TH.SE.DESIGN" 
    "Owner" = "vetuch.ta"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/dev-demo" = "owned"
  }
}

resource "aws_subnet" "public_terragrunt_1b" {
  vpc_id    =   aws_vpc.terragrunt.id
  cidr_block = "10.35.96.0/19"
  availability_zone = "ap-southeast-1b"

  tags =  {
    "Name" = "TH.SE.DESIGN" 
    "Owner" = "vetuch.ta"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/dev-demo" = "owned"
  }
}
