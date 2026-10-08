variable "project_name" { type = string }
variable "environment" { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "frontend_security_group_id" { type = string }
variable "backend_security_group_id" { type = string }

variable "frontend_target_group_arn" { type = string }
variable "backend_target_group_arn" { type = string }

variable "execution_role_arn" { type = string }
variable "frontend_task_role_arn" { type = string }
variable "backend_task_role_arn" { type = string }

variable "db_endpoint" { type = string }
variable "db_name" { type = string }
variable "db_username" {
  type      = string
  sensitive = true
}
variable "db_secret_arn" {
  type      = string
  sensitive = true
}

variable "frontend_image" { type = string }
variable "backend_image" { type = string }

variable "frontend_cpu" {\n  type    = number\n  default = 256\n}
variable "frontend_memory" {\n  type    = number\n  default = 512\n}
variable "backend_cpu" {\n  type    = number\n  default = 512\n}
variable "backend_memory" {\n  type    = number\n  default = 1024\n}

variable "frontend_desired_count" {\n  type    = number\n  default = 2\n}
variable "backend_desired_count" {\n  type    = number\n  default = 2\n}

variable "log_retention_days" {\n  type    = number\n  default = 30\n}
