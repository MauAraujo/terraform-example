resource "aws_placement_group" "api_placement_group" {
  name     = "api_placement_group"
  strategy = "cluster"
}

resource "aws_launch_configuration" "api_launch_config" {
  name_prefix   = var.name_prefix
  image_id      = var.image_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "api_autoscaling_group" {
  name                      = var.asg_name
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = var.desired_capacity
  force_delete              = true
  placement_group           = aws_placement_group.api_placement_group.id
  launch_configuration      = aws_launch_configuration.api_launch_config.name
  vpc_zone_identifier       = var.subnet_ids

  target_group_arns = var.target_group_arns

  timeouts {
    delete = "15m"
  }
}
