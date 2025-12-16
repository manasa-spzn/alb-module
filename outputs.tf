output "alb_url" {
  description = "URL of the ALB"
  value = "http://${aws_lb.my_alb.dns_name}"
}