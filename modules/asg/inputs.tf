variable "asg_name" {
  type        = string
  description = "Name of the Auto-Scaling Group."
}

variable "name_prefix" {
  type        = string
  description = "Name prefix for the launch configuration used by the ASG."
}

variable "image_id" {
  type        = string
  description = "Identifier of the machine image to use in the launch configuration."
}

variable "instance_type" {
  type        = string
  description = "Type of instance to use."
}

variable "min_size" {
  type        = number
  description = "The minimum number of instances started by the ASG."
}

variable "max_size" {
  type        = number
  description = "The maximum number of instances started by the ASG."
}

variable "desired_capacity" {
  type        = number
  description = "The number of instances that should always be running."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet ids where the instances will be created."
}

variable "target_group_arns" {
  type        = list(string)
  description = "Used to attach the Application Load Balancer to the ASG."
}
