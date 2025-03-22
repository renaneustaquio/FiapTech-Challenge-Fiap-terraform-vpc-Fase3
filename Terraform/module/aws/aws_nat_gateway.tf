resource "aws_nat_gateway" "mcking_nat_gateway" {
  allocation_id = aws_eip.mcking_nat_eip.id
  subnet_id     = aws_subnet.mcking_subnet_publica_1.id

  tags = {
    Name = "mcking-nat-gateway"
  }
}