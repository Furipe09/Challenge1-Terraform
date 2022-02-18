resource "aws_vpc" "vpc_Earth" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name     = "VPC_Earth"
    Provider = "terraform"
  }
}

resource "aws_internet_gateway" "igw_Earth" {
  vpc_id = aws_vpc.vpc_Earth.id
  tags = {
    Name     = "IGW_Earth"
    Provider = "terraform"
  }
}

resource "aws_subnet" "subNet_Earth_a" {
  vpc_id            = aws_vpc.vpc_Earth.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name     = "subNet_Earth_a"
    Provider = "terraform"
  }
}

resource "aws_subnet" "subNet_Earth_b" {
  vpc_id            = aws_vpc.vpc_Earth.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name     = "subNet_Earth_b"
    Provider = "terraform"
  }
}

resource "aws_subnet" "subNet_Earth_c" {
  vpc_id            = aws_vpc.vpc_Earth.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name     = "subNet_Earth_c"
    Provider = "terraform"
  }
}

resource "aws_route_table" "PubRT_Earth" {
  vpc_id = aws_vpc.vpc_Earth.id
  tags = {
    Name     = "PubRT_Earth"
    Provider = "terraform"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_Earth.id
  }
}

resource "aws_route_table_association" "Public_association_Earth_a" {
  subnet_id      = aws_subnet.subNet_Earth_a.id
  route_table_id = aws_route_table.PubRT_Earth.id
}

resource "aws_route_table_association" "Public_association_Earth_b" {
  subnet_id      = aws_subnet.subNet_Earth_b.id
  route_table_id = aws_route_table.PubRT_Earth.id
}

resource "aws_route_table_association" "Public_association_Earth_c" {
  subnet_id      = aws_subnet.subNet_Earth_c.id
  route_table_id = aws_route_table.PubRT_Earth.id
}
