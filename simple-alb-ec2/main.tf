provider "aws" {
  region = var.aws_region
}

module "networking" {
  source = "./modules/networking"

  app_name            = var.app_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "security" {
  source = "./modules/security"

  app_name        = var.app_name
  vpc_id          = module.networking.vpc_id
  app_port        = var.app_port
  ssh_allowed_cidr = var.ssh_allowed_cidr
}

module "alb" {
  source = "./modules/alb"

  app_name          = var.app_name
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  app_port          = var.app_port
  health_check_path = var.health_check_path
}

module "compute" {
  source = "./modules/compute"

  app_name             = var.app_name
  vpc_id               = module.networking.vpc_id
  public_subnet_ids    = module.networking.public_subnet_ids
  app_sg_id            = module.security.app_sg_id
  target_group_arn     = module.alb.target_group_arn
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  app_port             = var.app_port
  github_repo_url      = var.github_repo_url
  asg_min_size         = var.asg_min_size
  asg_max_size         = var.asg_max_size
  asg_desired_capacity = var.asg_desired_capacity
}