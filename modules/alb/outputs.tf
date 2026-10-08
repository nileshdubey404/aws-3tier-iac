output "alb_id" { value = aws_lb.this.id }
output "alb_arn" { value = aws_lb.this.arn }
output "alb_dns_name" { value = aws_lb.this.dns_name }
output "frontend_target_group_arn" { value = aws_lb_target_group.frontend.arn }
output "backend_target_group_arn" { value = aws_lb_target_group.backend.arn }
output "http_listener_arn" {
  value = var.enable_https ? aws_lb_listener.http[0].arn : aws_lb_listener.http_only[0].arn
}
output "https_listener_arn" {
  value = var.enable_https ? aws_lb_listener.https[0].arn : null
}
