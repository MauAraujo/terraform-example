include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//asg?ref=v0.0.1"
}

inputs = {
  asg_name         = "dev-asg"
  name_prefix      = "dev-"
  image_id         = ""
  instance_type    = "t2.micro"
  min_size         = 1
  max_size         = 1
  desired_capacity = 1
  subnets          = []
}
