variable "project_name" { type = string }
variable "environment" { type = string }
variable "log_group_arns" { type = list(string) }
variable "db_secret_arn" { type = string }
