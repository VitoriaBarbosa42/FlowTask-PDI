output "container_name" {
  description = "Nome do container do LocalStack"
  value       = docker_container.localstack.name
}

output "endpoint_url" {
  description = "URL do endpoint LocalStack para clientes AWS"
  value       = "http://localhost:${var.host_port}"
}
