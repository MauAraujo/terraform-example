variable "cidr_block" {
  type        = string
  description = "CIDR block used by the VPC."
}

variable "subnets" {
  type        = map(string)
  description = "List of CIDR blocks used by subnets (one for each subnet). They should be consistent with the block used by the VPC."
}

variable "api_port" {
  type        = number
  description = "Port where the API server runs, used for Security Groups to allow traffic on the port."
}
