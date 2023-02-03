include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//datastore?ref=v0.0.1"
}

inputs = {
  db_name              = "dev-db"
  instance_type        = "db.t2.micro"
  engine_version       = "14.6"
  parameter_group_name = "default.postgres14.6"
}
