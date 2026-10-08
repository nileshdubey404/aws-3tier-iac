variable "project_name" { type = string }
variable "environment" { type = string }
variable "vpc_id" { type = string }
variable "public_subnet_ids" { type = list(string) }
variable "security_group_id" { type = string }

variable "frontend_port" {
  type    = number
  default = 80
}

variable "backend_port" {
  type    = number
  default = 8080
}

variable "frontend_health_check_path" {
  type    = string
  default = "/"
}

variable "backend_health_check_path" {
  type    = string
  default = "/actuator/health"
}

variable "enable_deletion_protection" {
  type    = bool
  default = false
}

variable "enable_https" {
  type    = bool
  default = false
}

variable "certificate_arn" {
  description = "ACM certificate ARN. Required when HTTPS is enabled."
  type        = string
  default     = null
}
