resource "aws_eip" "nat_terragrunt" {
  vpc = true

  tags =  {
    "Name" = "TH.SE.DESIGN" 
    "Owner" = "vetuch.ta"
  }  
}

resource "aws_nat_gateway" "nat_terragrunt" {
  allocation_id = aws_eip.nat_terragrunt.id
  subnet_id = aws_subnet.public_terragrunt_1a.id

  tags =  {
    "Name" = "TH.SE.DESIGN" 
    "Owner" = "vetuch.ta"
  }  

  depends_on = [aws_internet_gateway.igw]  
}