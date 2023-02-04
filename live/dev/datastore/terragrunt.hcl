include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//datastore?ref=v0.0.1"
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    subnet_ids = ["mock_subnet_id"]
  }
}

inputs = {
  db_name              = "devdb"
  instance_type        = "db.t3.micro"
  engine_version       = "14.6"
  parameter_group_name = "default.postgres14.6"
  subnet_ids           = dependency.vpc.outputs.subnet_ids
}
