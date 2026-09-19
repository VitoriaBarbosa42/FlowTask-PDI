output "container_id" {
  description = "ID do conteiner Docker do mongo"
  value       = docker_container.mongo.id
}

output "container_name" {
  description = "Nome do container no Docker"
  value       = docker_container.mongo.name
}

output "connection_string" {
  description = "String de conexão para conectar do host (Spring Boot local)"
  value       = "mongodb://${var.mongo_user}:${var.mongo_password}@localhost:${var.host_port}/${var.mongo_db}?authSource=admin"
}