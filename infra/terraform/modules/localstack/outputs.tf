output "container_name" {
  description = "Nome do container do LocalStack"
  value       = docker_container.localstack.name
}

output "endpoint_url" {
  description = "URL do endpoint LocalStack para clientes AWS"
  value       = "http://localhost:${var.host_port}"
}

output "s3_bucket_name" {
  description = "Nome do bucket S3 de anexos"
  value       = aws_s3_bucket.attachments.id
}

output "sqs_dlq_url" {
  description = "URL da fila Dead Letter Queue (SQS)"
  value       = aws_sqs_queue.dlq.id
}

output "secrets_arn" {
  description = "ARN do segredo no Secrets Manager"
  value       = aws_secretsmanager_secret.app_secrets.arn
}
