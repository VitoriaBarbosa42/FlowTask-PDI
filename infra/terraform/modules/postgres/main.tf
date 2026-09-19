terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

# Recurso de Volume fora do bloco terraform
resource "docker_volume" "postgres_data" {
  name = "flowtask-postgres-data"
}

# 1. Garante o download da imagem oficial do PostgreSQL 15 Alpine
resource "docker_image" "postgres" {
  name         = "postgres:15-alpine"
  keep_locally = true
}

# 2. Cria e configura o Container do PostgreSQL
resource "docker_container" "postgres" {
  name  = "flowtask-postgres"
  image = docker_image.postgres.image_id

  restart = "unless-stopped"

  env = [
    "POSTGRES_USER=${var.database_user}",
    "POSTGRES_PASSWORD=${var.database_password}",
    "POSTGRES_DB=${var.database_name}"
  ]

  ports {
    internal = 5432
    external = var.host_port
  }

  networks_advanced {
    name    = var.network_id
    aliases = ["postgres"]
  }

  # Aqui dentro do container você conecta o volume criado acima:
  volumes {
    volume_name    = docker_volume.postgres_data.name
    container_path = "/var/lib/postgresql/data"
  }

  upload {
    content = "CREATE DATABASE flowtask_keycloak;\n"
    file    = "/docker-entrypoint-initdb.d/init-keycloak.sql"
  }
}