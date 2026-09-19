output "container_name" {
  description = "Nome do container do Apache Kafka"
  value       = docker_container.kafka.name
}

output "bootstrap_servers_host" {
  description = "Endereço do bootstrap broker para clientes no Host"
  value       = "localhost:${var.host_port}"
}

output "bootstrap_servers_internal" {
  description = "Endereço do bootstrap broker para clientes internos no Docker"
  value       = "flowtask-kafka:29092"
}
