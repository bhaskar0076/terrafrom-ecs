variable "cluster_name" {}
variable "execution_role_arn" {}
variable "alb_target_group_arn" {}

variable "execution_role_name" {
  description = "The name of the IAM role for ECS task execution"
  type        = string
  default     = "ecsTaskExecutionRole"
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

variable "private_subnets" {
  description = "The private subnets for the ECS service"
  type        = list(string)
}