output "vpc_id" {
  value       = aws_vpc.main_vpc.id
  description = "ID of the VPC."
}

output "subnet_ids" {
  value       = [for subnet in aws_subnet.api_subnets : subnet.id]
  description = "List of subnet ids belonging to the VPC."
}

output "security_group_ids" {
  value       = [aws_security_group.api_security_group.id]
  description = "List of security group ids belonging to the VPC."
}
