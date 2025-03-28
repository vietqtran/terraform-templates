variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs of the public subnets"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "ID of the ALB security group"
  type        = string
}

variable "app_port" {
  description = "Port on which the application runs"
  type        = number
}

variable "health_check_path" {
  description = "Path for health checks"
  type        = string
}