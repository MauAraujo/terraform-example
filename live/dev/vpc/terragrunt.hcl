include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//vpc?ref=v0.0.1"
}

inputs = {
  api_port   = 8080
  cidr_block = "10.0.0.0/16"
  subnets = {
    "us-east-1a" : "10.0.1.0/24",
    "us-east-1b" : "10.0.2.0/24"
  }
}
