output "container_id" {
  description = "ID do conteiner Docker do PostgreSQL"
  value = docker_container.postgres.id
}

output "container_name" {
  description = "Nome do container no Docker"
  value = docker_container.postgres.name
}

output "jdbc_url" {
  description = "URL JDBC para conectar do host (Spring Boot local)"
  value = "jdbc:postgresql://localhost:${var.host_port}/${var.database_name}"
}

output "internal_jdbc_url" {
  description = "URL JDBC para conectar de dentro da rede Docker (Keycloak)"
  value = "jdbc:postgresql://postgres:5432/flowtask_keycloak"
}

