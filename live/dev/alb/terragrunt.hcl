include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//alb?ref=v0.0.1"
}

locals {
  env = "dev"
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider  "aws" {
  default_tags {
    tags = {
      Environment     = "${local.env}"
    }
  }
}
EOF
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    vpc_id             = "mock_vpc_id"
    subnet_ids         = ["mock_subnet_id"]
    security_group_ids = ["mock_sg_id"]
  }
}

inputs = {
  alb_name           = "load-balancer-${local.env}"
  api_port           = 8080
  target_group_name  = "load-balancer-targets-${local.env}"
  vpc_id             = dependency.vpc.outputs.vpc_id
  subnet_ids         = dependency.vpc.outputs.subnet_ids
  security_group_ids = dependency.vpc.outputs.security_group_ids
}
