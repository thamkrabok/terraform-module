resource "aws_eip" "this" {
  vpc = true

  tags = merge(
      { Name = "${var.env}-nat" },
      var.tags
  )
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id = aws_subnet.public[0].id

  tags = merge(
      { Name = "${var.env}-nat" },
      var.tags
  )
  depends_on = [aws_internet_gateway.this]  
}