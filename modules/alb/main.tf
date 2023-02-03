resource "aws_lb" "main_lb" {
  name                     = "main_alb"
  internal                 = false
  load_balancer_type       = "application"
  security_groups          = []
  subnets                  = []
  enable_delete_protection = true
}
