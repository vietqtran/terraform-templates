output "alb_sg_id" {
  value       = aws_security_group.alb_sg.id
  description = "The ID of the ALB security group"
}

output "app_sg_id" {
  value       = aws_security_group.app_sg.id
  description = "The ID of the application security group"
}