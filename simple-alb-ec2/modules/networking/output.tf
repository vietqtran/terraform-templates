output "vpc_id" {
  value       = aws_vpc.app_vpc.id
  description = "The ID of the VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnets[*].id
  description = "The IDs of the public subnets"
}

output "igw_id" {
  value       = aws_internet_gateway.app_igw.id
  description = "The ID of the Internet Gateway"
}