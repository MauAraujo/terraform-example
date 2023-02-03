variable "alb_name" {
  type = string
}

variable "api_port" {
  type = number
}

variable "target_group_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}