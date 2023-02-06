variable "identifier_prefix" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "instance_type" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "blue_green_update_enabled" {
  type = boolean
}
