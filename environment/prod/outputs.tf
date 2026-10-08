output "vpc_id" { value = module.networking.vpc_id }
output "alb_dns_name" { value = module.alb.alb_dns_name }
output "frontend_ecr_repository_url" { value = module.ecr.frontend_repository_url }
output "backend_ecr_repository_url" { value = module.ecr.backend_repository_url }
output "ecs_cluster_name" { value = module.ecs.cluster_id }
output "frontend_service_name" { value = module.ecs.frontend_service_name }
output "backend_service_name" { value = module.ecs.backend_service_name }
output "rds_endpoint" { value = module.rds.db_endpoint }
output "rds_secret_arn" {
  value     = module.rds.db_master_user_secret_arn
  sensitive = true
}
