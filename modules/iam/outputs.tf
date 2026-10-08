output "execution_role_arn" { value = aws_iam_role.execution.arn }
output "execution_role_name" { value = aws_iam_role.execution.name }
output "frontend_task_role_arn" { value = aws_iam_role.frontend_task.arn }
output "backend_task_role_arn" { value = aws_iam_role.backend_task.arn }
