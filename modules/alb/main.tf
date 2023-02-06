resource "aws_lb" "api_load_balancer" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "api_targets" {
  name     = var.target_group_name
  port     = var.api_port
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
  load_balancer_arn = aws_lb.api_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_targets.arn
  }
}
