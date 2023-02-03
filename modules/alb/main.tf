resource "aws_lb" "api_load_balancer" {
  name                       = var.alb_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = var.security_group_ids
  subnets                    = var.subnet_ids
  enable_deletion_protection = true
}

resource "aws_lb_target_group" "api_targets" {
  name     = var.target_group_name
  port     = var.port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled  = true
    matcher  = "200,202"
    path     = "/health"
    protocol = "HTTP"
  }
}

resource "aws_lb_listener" "api_lb_listener" {
  load_balancer_arn = aws_lb.api_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_targets.arn
  }
}
