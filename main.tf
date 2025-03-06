provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source         = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
  execution_role_name = var.execution_role_name
  # Add necessary inputs for the IAM module
}

module "alb" {
  source              = "./modules/alb"
  vpc_id              = module.vpc.vpc_id
  public_subnets      = module.vpc.public_subnets
  security_group_ids  = [module.alb.alb_sg_id]
  # Add other necessary inputs for the ALB module
}

module "ecs" {
  source                = "./modules/ecs"
  private_subnets       = module.vpc.private_subnets
  execution_role_arn    = module.iam.execution_role_arn
  container_image       = var.container_image
  container_name        = var.container_name
  task_security_group   = module.alb.alb_sg_id
  execution_role_name   = var.execution_role_name
  alb_target_group_arn  = module.alb.target_group_arn
  cluster_name          = var.cluster_name
  # Add other necessary inputs for the ECS module
}