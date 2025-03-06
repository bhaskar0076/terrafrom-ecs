variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "The public subnets for the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "The private subnets for the VPC"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "my-ecs-cluster"
}

variable "container_name" {
  description = "The name of the container"
  type        = string
  default     = "my-container"
}

variable "container_image" {
  description = "The container image to use for the ECS service"
  type        = string
  default     = "034362058614.dkr.ecr.eu-west-1.amazonaws.com/myapp:latest"
}

variable "task_security_group" {
  description = "The security group for the ECS task"
  type        = string
  default     = "sg-0123456789abcdef0"
}

variable "execution_role_name" {
  description = "The name of the IAM role for ECS task execution"
  type        = string
  default     = "ecsTaskExecutionRole"
}