include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//vpc?ref=v0.0.1"
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

inputs = {
  api_port   = 8080
  cidr_block = "10.0.0.0/16"
  subnets = {
    "us-east-1a" : "10.0.1.0/24",
    "us-east-1b" : "10.0.2.0/24"
  }
}
