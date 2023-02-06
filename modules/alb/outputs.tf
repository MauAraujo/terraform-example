output "target_group_arns" {
  value       = [aws_lb_target_group.api_targets.arn]
  description = "List of ARNs belonging to the targets of the ALB."
}
