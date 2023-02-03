resource "aws_vpc" "asg_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "asg_subnet_1" {
  vpc_id     = aws_vpc.asg_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "api_security_group" {
  name   = "api_security_group"
  vpc_id = aws_vpc.asg_vpc.id

  ingress {
    from_port        = var.api_port
    to_port          = var.api_port
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.asg_vpc.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.asg_vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
