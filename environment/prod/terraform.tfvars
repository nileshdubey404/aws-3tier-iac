aws_region  = "ap-south-1"
project_name = "three-tier-app"
environment  = "prod"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

database_subnet_cidrs = [
  "10.0.21.0/24",
  "10.0.22.0/24"
]

# Production: one NAT Gateway per AZ for better availability.
single_nat_gateway = false

# Replace these with immutable ECR image URIs created by CI/CD.
frontend_image = "REPLACE_WITH_FRONTEND_ECR_URI:git-REPLACE_ME"
backend_image  = "REPLACE_WITH_BACKEND_ECR_URI:git-REPLACE_ME"

database_name             = "appdb"
database_username         = "appadmin"
database_engine_version   = "16"
database_instance_class   = "db.t3.micro"
database_allocated_storage = 20
database_max_allocated_storage = 100
database_multi_az         = true
database_backup_retention_period = 14
database_deletion_protection = true
database_skip_final_snapshot = false
database_apply_immediately = false

alb_deletion_protection = true

# For real production, enable HTTPS and provide an ACM certificate ARN.
alb_enable_https = false
alb_certificate_arn = null

frontend_desired_count = 2
backend_desired_count  = 2

ecs_log_retention_days = 30
