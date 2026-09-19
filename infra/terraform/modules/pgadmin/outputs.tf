output "container_id" {
  description = "ID do conteiner Docker do pgAdmin"
  value       = docker_container.pgadmin.id
}

output "container_name" {
  description = "Nome do container no Docker"
  value       = docker_container.pgadmin.name
}

output "web_url" {
  description = "URL para acessar o pgAdmin no navegador"
  value       = "http://localhost:${var.host_port}"
  
}