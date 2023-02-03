include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//cache?ref=v0.0.1"
}

inputs = {
  cluster_id           = "dev-cache-cluster"
  node_type            = "cache.m4.micro"
  nodes                = 1
  engine_version       = "3.2.10"
  parameter_group_name = "default.redis3.2"
  port                 = 6379
}
