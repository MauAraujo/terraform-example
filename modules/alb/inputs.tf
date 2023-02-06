variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer."
}

variable "api_port" {
  type        = number
  description = "The port on which the ALB receives traffic."
}

variable "target_group_name" {
  type        = string
  description = "Name of the targets the ALB will forward traffic to."
}

variable "vpc_id" {
  type        = string
  description = "Identifier of the VPC where the ALB will be created."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet ids belonging to the VPC. Its required to have at least 2 subnets with different Availability Zones."
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group ids to assign to the ALB."
}
