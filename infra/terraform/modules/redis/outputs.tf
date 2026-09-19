output "container_id" {
    description = "ID do conteiner Docker do Redis"
    value = docker_container.redis.id
}

output "container_name" {
    description = "Nome do container no Docker"
    value = docker_container.redis.name
}

output "connection_url" {
    description = "URL de conexão para conectar do host (Spring Boot local)"
    value = "redis://localhost:${var.host_port}"
  
}
