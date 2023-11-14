resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.terragrunt.id

    tags =  {
        "Name" = "TH.SE.DESIGN"
        "Owner" = "vetuch.ta"
    }
}