variable "identifier_prefix" {
  type        = string
  description = "Unique name for the RDS cluster."
}

variable "db_name" {
  type        = string
  description = "Name of the database."
}

variable "db_username" {
  type        = string
  sensitive   = true
  description = "Username for the database. Should be passed as a TF_VAR to avoid leaking secrets."
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Password for the database. Should be passed as a TF_VAR to avoid leaking secrets."
}

variable "instance_type" {
  type        = string
  description = "The type of instance the database cluster runs on."
}

variable "engine_version" {
  type        = string
  description = "Version of the database engine."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet ids where the database cluster will be created. Its required to have at least 2 subnets in different Availability Zones."
}

variable "blue_green_update_enabled" {
  type        = bool
  description = "If the Blue Green update strategy is enabled. This is recommended on prod environments."
}
