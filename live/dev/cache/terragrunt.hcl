include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//cache?ref=v0.0.1"
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
    subnet_ids = ["mock_subnet_id"]
  }
}

inputs = {
  cluster_id           = "${local.env}-cache-cluster"
  node_type            = "cache.t2.micro"
  nodes                = 1
  engine_version       = "7.0"
  parameter_group_name = "default.redis7"
  port                 = 6379
  subnet_ids           = dependency.vpc.outputs.subnet_ids
}
