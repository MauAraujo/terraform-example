output "vpc_id" {
  value = aws_vpc.asg_vpc.id
}

output "subnet_ids" {
  value = [for subnet in aws_subnet.asg_subnets : subnet.id]
}

output "security_group_ids" {
  value = [aws_security_group.api_security_group.id]
}
