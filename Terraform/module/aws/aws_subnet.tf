resource "aws_subnet" "mcking_subnet_publica_1" {
  vpc_id                  = aws_vpc.mcking_vpc.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "mcking-subnet-publica-1"
    Type = "public"
  }
}

resource "aws_subnet" "mcking_subnet_publica_2" {
  vpc_id                  = aws_vpc.mcking_vpc.id
  cidr_block              = "10.1.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "mcking-subnet-publica-2"
    Type = "public"
  }
}

resource "aws_subnet" "mcking_subnet_privada_1" {
  vpc_id            = aws_vpc.mcking_vpc.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "mcking-subnet-privada-1"
    Type = "private"
  }
}

resource "aws_subnet" "mcking_subnet_privada_2" {
  vpc_id            = aws_vpc.mcking_vpc.id
  cidr_block        = "10.1.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "mcking-subnet-privada-2"
    Type = "private"
  }
}