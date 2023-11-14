output "vpc_id" {
  value = aws_vpc.terragrunt.id
}

output "igw" {
  value = aws_internet_gateway.igw.id
}
