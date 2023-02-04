variable "cidr_block" {
  type = string
}

variable "subnets" {
  type = map(string)
}

variable "api_port" {
  type = number
}
