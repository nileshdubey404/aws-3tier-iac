variable "project_name" { type = string }
variable "environment" { type = string }
variable "database_subnet_ids" { type = list(string) }
variable "security_group_ids" { type = list(string) }

variable "engine_version" {
  type    = string
  default = "16"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "allocated_storage" {
  type    = number
  default = 20
}

variable "max_allocated_storage" {
  type    = number
  default = 100
}

variable "database_name" {
  type    = string
  default = "appdb"
}

variable "master_username" {
  type      = string
  default   = "appadmin"
  sensitive = true
}

variable "multi_az" {\n  type    = bool\n  default = false\n}
variable "backup_retention_period" {\n  type    = number\n  default = 7\n}
variable "deletion_protection" {\n  type    = bool\n  default = false\n}
variable "skip_final_snapshot" {\n  type    = bool\n  default = true\n}
variable "apply_immediately" {\n  type    = bool\n  default = false\n}
