output "vpc_id" {
  value       = module.networking.vpc_id
  description = "The ID of the VPC"
}

output "public_subnet_ids" {
  value       = module.networking.public_subnet_ids
  description = "The IDs of the public subnets"
}

output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The DNS name of the load balancer"
}

output "alb_arn" {
  value       = module.alb.alb_arn
  description = "The ARN of the load balancer"
}

output "target_group_arn" {
  value       = module.alb.target_group_arn
  description = "The ARN of the target group"
}

output "asg_name" {
  value       = module.compute.asg_name
  description = "The name of the Auto Scaling Group"
}

output "launch_template_id" {
  value       = module.compute.launch_template_id
  description = "The ID of the launch template"
}

output "app_security_group_id" {
  value       = module.security.app_sg_id
  description = "The ID of the application security group"
}

output "alb_security_group_id" {
  value       = module.security.alb_sg_id
  description = "The ID of the ALB security group"
}

output "ami_id" {
  value       = module.compute.ami_id
  description = "The ID of the AMI being used"
}

output "ami_name" {
  value       = module.compute.ami_name
  description = "The name of the AMI being used"
}