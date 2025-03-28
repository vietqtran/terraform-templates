variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "app_port" {
  description = "Port on which the application runs"
  type        = number
}

variable "ssh_allowed_cidr" {
  description = "CIDR blocks allowed to SSH into instances"
  type        = list(string)
}