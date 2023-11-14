resource "aws_route_table" "private_terragrunt" {
  vpc_id = aws_vpc.terragrunt.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_terragrunt.id
  }

  tags =  {
    "Name" = "staging"
    "Owner" = "vetuch.ta"
    "Project" = "TH.SE.DESIGN"
  }  
}

resource "aws_route_table" "public_terragrunt" {
  vpc_id = aws_vpc.terragrunt.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_terragrunt.id
  }

  tags =  {
    "Name" = "staging"
    "Owner" = "vetuch.ta"
    "Project" = "TH.SE.DESIGN"
  }  
}
#test
resource "aws_route_table_association" "private_terragrunt_1a" {
  subnet_id = aws_subnet.private_terragrunt_1a.id
  route_table_id = aws_route_table.private_terragrunt.id
}

resource "aws_route_table_association" "private_terragrunt_1b" {
  subnet_id = aws_subnet.private_terragrunt_1b.id
  route_table_id = aws_route_table.private_terragrunt.id
}

resource "aws_route_table_association" "public_terragrunt_1a" {
  subnet_id = aws_subnet.public_terragrunt_1a.id
  route_table_id = aws_route_table.public_terragrunt.id
}

resource "aws_route_table_association" "public_terragrunt_1b" {
  subnet_id = aws_subnet.public_terragrunt_1b.id
  route_table_id = aws_route_table.public_terragrunt.id
}