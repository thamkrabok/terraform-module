resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.terragrunt.id

    tags =  {
        "Name" = "staging"
        "Owner" = "vetuch.ta"
        "Project" = "TH.SE.DESIGN"
    }
}

#test