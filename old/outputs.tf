output "frontend_instance_id" {
  value = aws_instance.frontend.id
}

output "backend_instance_id" {
  value = aws_instance.backend.id
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint
}
