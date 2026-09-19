terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

# 1. Garante o download da imagem do Keycloak
resource "docker_image" "keycloak" {
  name         = "quay.io/keycloak/keycloak:latest"
  keep_locally = true
}

# 2. Container Keycloak em modo start-dev com importação de Realm
resource "docker_container" "keycloak" {
  name    = "flowtask-keycloak"
  image   = docker_image.keycloak.image_id
  restart = "unless-stopped"
  command = ["start-dev", "--import-realm"]

  ports {
    internal = 8080
    external = var.host_port
  }

  networks_advanced {
    name    = var.network_id
    aliases = ["keycloak", "flowtask-keycloak"]
  }

  env = [
    "KEYCLOAK_ADMIN=${var.admin_user}",
    "KEYCLOAK_ADMIN_PASSWORD=${var.admin_password}",
    "KC_DB=postgres",
    "KC_DB_URL=jdbc:postgresql://postgres:5432/${var.database_name}",
    "KC_DB_USERNAME=${var.database_user}",
    "KC_DB_PASSWORD=${var.database_password}",
    "KC_HOSTNAME=localhost",
    "KC_HOSTNAME_PORT=${var.host_port}",
    "KC_HTTP_ENABLED=true",
    "KC_HEALTH_ENABLED=true"
  ]

  upload {
    file    = "/opt/keycloak/data/import/flowtask-realm.json"
    content = file(var.realm_file_path)
  }
}
