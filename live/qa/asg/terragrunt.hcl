include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:MauAraujo/terraform-modules.git//asg?ref=v0.0.1"
}

locals {
  env = "qa"
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

dependency "alb" {
  config_path = "../alb"
  mock_outputs = {
    target_group_arns = ["mock_tg_arn"]
  }
}

inputs = {
  asg_name          = "${local.env}-asg"
  name_prefix       = local.env
  image_id          = "ami-00874d747dde814fa"
  instance_type     = "m4.2xlarge"
  min_size          = 1
  max_size          = 1
  desired_capacity  = 1
  subnet_ids        = dependency.vpc.outputs.subnet_ids
  target_group_arns = dependency.alb.outputs.target_group_arns
}
