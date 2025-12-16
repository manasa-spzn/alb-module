output "alb_url" {
  description = "URL of the ALB"
  value = "http://${aws_lb.my_alb.dns_name}"
}

output "target_group_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.alb_target_group.arn
}