resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "api_subnets" {
  for_each          = var.subnets
  vpc_id            = aws_vpc.main_vpc.id
  availability_zone = each.key
  cidr_block        = each.value
}

resource "aws_internet_gateway" "main_internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_security_group" "api_security_group" {
  name   = "api_security_group"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = var.api_port
    to_port     = var.api_port
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
