variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "database_subnet_cidrs" {
  type = list(string)
}

variable "single_nat_gateway" {
  type = bool
}

variable "frontend_image" {
  description = "Full ECR image URI including immutable tag."
  type        = string
}

variable "backend_image" {
  description = "Full ECR image URI including immutable tag."
  type        = string
}

variable "database_name" {
  type = string
}

variable "database_username" {
  type      = string
  sensitive = true
}

variable "database_engine_version" {
  type = string
}

variable "database_instance_class" {
  type = string
}

variable "database_allocated_storage" {
  type = number
}

variable "database_max_allocated_storage" {
  type = number
}

variable "database_multi_az" {
  type = bool
}

variable "database_backup_retention_period" {
  type = number
}

variable "database_deletion_protection" {
  type = bool
}

variable "database_skip_final_snapshot" {
  type = bool
}

variable "database_apply_immediately" {
  type = bool
}

variable "alb_deletion_protection" {
  type = bool
}

variable "alb_enable_https" {
  type = bool
}

variable "alb_certificate_arn" {
  type    = string
  default = null
}

variable "frontend_desired_count" {
  type = number
}

variable "backend_desired_count" {
  type = number
}

variable "ecs_log_retention_days" {
  type = number
}
