include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//vpc?ref=v0.0.1"
}

inputs = {
  api_port = 8080
}
