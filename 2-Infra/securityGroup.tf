data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "sg_One" {
  #name        = "sg_One"
  description = "Libera portas inbound 22/80"
  vpc_id      = aws_vpc.vpc_One.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.aws_instance_tags,
    {
      Name = "SG-${var.name_Project}"
    },
  )
}