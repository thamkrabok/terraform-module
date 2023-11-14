resource "aws_eip" "nat_terragrunt" {
  vpc = true

  tags =  {
    "Name" = "staging"
    "Owner" = "vetuch.ta"
    "Project" = "TH.SE.DESIGN"
  }  
}

resource "aws_nat_gateway" "nat_terragrunt" {
  allocation_id = aws_eip.nat_terragrunt.id
  subnet_id = aws_subnet.public_terragrunt_1a.id

  tags =  {
    "Name" = "staging"
    "Owner" = "vetuch.ta"
    "Project" = "TH.SE.DESIGN"
  }  

  depends_on = [aws_internet_gateway.igw]  
}