resource "aws_eip" "mcking_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "mcking-nat-eip"
  }

  depends_on = [aws_internet_gateway.mcking_internet_gateway]
}