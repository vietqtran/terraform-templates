output "asg_name" {
  value       = aws_autoscaling_group.app_asg.name
  description = "The name of the Auto Scaling Group"
}

output "launch_template_id" {
  value       = aws_launch_template.app_launch_template.id
  description = "The ID of the launch template"
}

output "scale_up_policy_arn" {
  value       = aws_autoscaling_policy.scale_up.arn
  description = "The ARN of the scale up policy"
}

output "scale_down_policy_arn" {
  value       = aws_autoscaling_policy.scale_down.arn
  description = "The ARN of the scale down policy"
}

output "ami_id" {
  value       = data.aws_ami.amazon_linux_2.id
  description = "The ID of the AMI being used"
}

output "ami_name" {
  value       = data.aws_ami.amazon_linux_2.name
  description = "The name of the AMI being used"
}