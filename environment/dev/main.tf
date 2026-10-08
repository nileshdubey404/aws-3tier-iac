module "networking" {
  source = "../../modules/networking"

  project_name          = var.project_name
  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  single_nat_gateway    = var.single_nat_gateway
}

module "security_groups" {
  source = "../../modules/security-groups"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.networking.vpc_id
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment  = var.environment
}

module "alb" {
  source = "../../modules/alb"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnet_ids
  security_group_id  = module.security_groups.alb_security_group_id
  enable_deletion_protection = var.alb_deletion_protection
  enable_https       = var.alb_enable_https
  certificate_arn    = var.alb_certificate_arn
}

module "rds" {
  source = "../../modules/rds"

  project_name          = var.project_name
  environment           = var.environment
  database_subnet_ids   = module.networking.database_subnet_ids
  security_group_ids    = [module.security_groups.rds_security_group_id]

  engine_version        = var.database_engine_version
  instance_class        = var.database_instance_class
  allocated_storage     = var.database_allocated_storage
  max_allocated_storage = var.database_max_allocated_storage
  database_name         = var.database_name
  master_username       = var.database_username

  multi_az                 = var.database_multi_az
  backup_retention_period  = var.database_backup_retention_period
  deletion_protection      = var.database_deletion_protection
  skip_final_snapshot      = var.database_skip_final_snapshot
  apply_immediately        = var.database_apply_immediately
}

module "iam" {
  source = "../../modules/iam"

  project_name  = var.project_name
  environment   = var.environment
  log_group_arns = []
  db_secret_arn  = module.rds.db_master_user_secret_arn
}

module "ecs" {
  source = "../../modules/ecs"

  project_name = var.project_name
  environment  = var.environment

  private_subnet_ids = module.networking.private_subnet_ids

  frontend_security_group_id = module.security_groups.frontend_security_group_id
  backend_security_group_id  = module.security_groups.backend_security_group_id

  frontend_target_group_arn = module.alb.frontend_target_group_arn
  backend_target_group_arn  = module.alb.backend_target_group_arn

  execution_role_arn      = module.iam.execution_role_arn
  frontend_task_role_arn  = module.iam.frontend_task_role_arn
  backend_task_role_arn   = module.iam.backend_task_role_arn

  db_endpoint    = module.rds.db_endpoint
  db_name        = module.rds.db_name
  db_username    = module.rds.db_master_username
  db_secret_arn  = module.rds.db_master_user_secret_arn

  frontend_image = var.frontend_image
  backend_image  = var.backend_image

  frontend_desired_count = var.frontend_desired_count
  backend_desired_count  = var.backend_desired_count
  log_retention_days     = var.ecs_log_retention_days
}
