variable "project_name" { type = string }
variable "environment" { type = string }
variable "vpc_id" { type = string }
variable "allowed_http_cidr_blocks" {
  description = "CIDRs allowed to reach the public ALB."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
