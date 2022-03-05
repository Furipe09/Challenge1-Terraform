resource "aws_vpc" "vpc_One" {
  cidr_block = "10.0.0.0/16"
  tags = merge(var.aws_instance_tags,
    {
      #Name     = "vpc_Earth"
      Name = "VPC-${var.name_Project}"
    },
  )
}

resource "aws_internet_gateway" "igw_One" {
  vpc_id = aws_vpc.vpc_One.id
  tags = merge(var.aws_instance_tags,
    {
      #Name     = "igw_Earth"
      Name = "IGW-${var.name_Project}"
    },
  )
}

resource "aws_subnet" "subNet_One_a" {
  vpc_id            = aws_vpc.vpc_One.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = merge(var.aws_instance_tags,
    {
      #Name     = "subNet_Earth_a"
      Name = "SubnetA-${var.name_Project}"
    },
  )
}

resource "aws_subnet" "subNet_One_b" {
  vpc_id            = aws_vpc.vpc_One.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = merge(var.aws_instance_tags,
    {
      #Name     = "subNet_Earth_b"
      Name = "SubnetB-${var.name_Project}"
    },
  )
}

resource "aws_subnet" "subNet_One_c" {
  vpc_id            = aws_vpc.vpc_One.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags = merge(var.aws_instance_tags,
    {
      #Name     = "subNet_Earth_c"
      Name = "SubnetC-${var.name_Project}"
    },
  )
}

resource "aws_route_table" "PubRT_One" {
  vpc_id = aws_vpc.vpc_One.id
  tags = merge(var.aws_instance_tags,
    {
      #Name     = "PubRT_Earth"
      Name = "PubRT-${var.name_Project}"
    },
  )

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_One.id
  }
}

resource "aws_route_table_association" "Public_association_One_a" {
  subnet_id      = aws_subnet.subNet_One_a.id
  route_table_id = aws_route_table.PubRT_One.id
}

resource "aws_route_table_association" "Public_association_One_b" {
  subnet_id      = aws_subnet.subNet_One_b.id
  route_table_id = aws_route_table.PubRT_One.id
}

resource "aws_route_table_association" "Public_association_One_c" {
  subnet_id      = aws_subnet.subNet_One_c.id
  route_table_id = aws_route_table.PubRT_One.id
}
