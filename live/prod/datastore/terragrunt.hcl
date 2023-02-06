include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:MauAraujo/terraform-modules.git//datastore?ref=v0.0.1"
}

locals {
  env = "prod"
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
  identifier_prefix         = local.env
  db_name                   = "${local.env}db"
  instance_type             = "db.r5b.xlarge"
  engine_version            = "14.6"
  subnet_ids                = dependency.vpc.outputs.subnet_ids
  blue_green_update_enabled = false
}
