output "vpc_id" {
  value = aws_vpc.asg_vpc.id
}

output "subnet_ids" {
  value = [aws_subnet.asg_subnet_1.id]
}

output "security_group_ids" {
  value = [aws_security_group.allow_tls.id]
}
