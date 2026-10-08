output "frontend_repository_name" { value = aws_ecr_repository.this["frontend"].name }
output "frontend_repository_url" { value = aws_ecr_repository.this["frontend"].repository_url }
output "backend_repository_name" { value = aws_ecr_repository.this["backend"].name }
output "backend_repository_url" { value = aws_ecr_repository.this["backend"].repository_url }
