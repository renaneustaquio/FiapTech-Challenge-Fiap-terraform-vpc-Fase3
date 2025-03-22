resource "aws_internet_gateway" "mcking_internet_gateway" {
  vpc_id = aws_vpc.mcking_vpc.id

  tags = {
    Name = "mcking-internet-gateway"
  }
}
