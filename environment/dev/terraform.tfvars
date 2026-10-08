aws_region  = "ap-south-1"
project_name = "three-tier-app"
environment  = "dev"

vpc_cidr = "10.10.0.0/16"

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

public_subnet_cidrs = [
  "10.10.1.0/24",
  "10.10.2.0/24"
]

private_subnet_cidrs = [
  "10.10.11.0/24",
  "10.10.12.0/24"
]

database_subnet_cidrs = [
  "10.10.21.0/24",
  "10.10.22.0/24"
]

# Dev can use one NAT Gateway to reduce cost.
single_nat_gateway = true

frontend_image = "REPLACE_WITH_FRONTEND_ECR_URI:git-REPLACE_ME"
backend_image  = "REPLACE_WITH_BACKEND_ECR_URI:git-REPLACE_ME"

database_name             = "appdb"
database_username         = "appadmin"
database_engine_version   = "16"
database_instance_class   = "db.t3.micro"
database_allocated_storage = 20
database_max_allocated_storage = 30
database_multi_az         = false
database_backup_retention_period = 7
database_deletion_protection = false
database_skip_final_snapshot = true
database_apply_immediately = true

alb_deletion_protection = false
alb_enable_https = false
alb_certificate_arn = null

frontend_desired_count = 1
backend_desired_count  = 1

ecs_log_retention_days = 7
