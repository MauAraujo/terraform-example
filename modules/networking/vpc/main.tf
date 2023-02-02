resource "aws_vpc" "cluster_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "cluster_subnet_1" {
  vpc_id     = aws_vpc.cluster_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "cluster_subnet_2" {
  vpc_id     = aws_vpc.cluster_vpc.id
  cidr_block = "10.0.2.0/24"
}
