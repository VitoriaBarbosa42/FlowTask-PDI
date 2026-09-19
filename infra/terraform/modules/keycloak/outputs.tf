output "container_name" {
  description = "Nome do container do Keycloak"
  value       = docker_container.keycloak.name
}

output "url" {
  description = "URL base de acesso ao Keycloak"
  value       = "http://localhost:${var.host_port}"
}

output "oidc_discovery_url" {
  description = "Endpoint Well-Known de descoberta OIDC do Realm flowtask"
  value       = "http://localhost:${var.host_port}/realms/flowtask/.well-known/openid-configuration"
}
