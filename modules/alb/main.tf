resource "aws_lb" "api_lb" {
  name                     = "api_alb"
  internal                 = false
  load_balancer_type       = "application"
  security_groups          = []
  subnets                  = []
  enable_delete_protection = true
}

resource "aws_lb_target_group" "api_lb_target_group" {
  name     = "cluster_lb_target_group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = ""
}

resource "aws_lb_listener" "api_lb_listener" {
  load_balancer_arn = aws_lb.cluster_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}
