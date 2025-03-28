output "alb_dns_name" {
  value       = aws_lb.app_alb.dns_name
  description = "The DNS name of the load balancer"
}

output "alb_arn" {
  value       = aws_lb.app_alb.arn
  description = "The ARN of the load balancer"
}

output "target_group_arn" {
  value       = aws_lb_target_group.app_tg.arn
  description = "The ARN of the target group"
}