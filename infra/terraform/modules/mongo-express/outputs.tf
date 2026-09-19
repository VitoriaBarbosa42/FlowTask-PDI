output "container_id" {
  description = "ID do conteiner Docker do mongo-express"
  value       = docker_container.mongo-express.id
}

output "container_name" {
  description = "Nome do container no Docker"
  value       = docker_container.mongo-express.name
}

output "web_url" {
  description = "URL para acessar o mongo-express no host"
  value       = "http://localhost:${var.host_port}"
}