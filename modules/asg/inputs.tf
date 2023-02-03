variable "asg_name" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}

variable "subnet_ids" {
  type = list(string)
}

variable "target_group_arns" {
  type = list(string)
}