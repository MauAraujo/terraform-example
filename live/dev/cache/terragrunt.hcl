include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//cache?ref=v0.0.1"
}