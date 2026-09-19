terraform {
    required_providers {
        docker = {
        source = "kreuzwerker/docker"
        }
    }
}

resource "docker_image" "pgadmin" {
    name         = "dpage/pgadmin4:latest"
    keep_locally = true
}

resource "docker_container" "pgadmin" {

  image = docker_image.pgadmin.image_id
  name  = "flowtask-pgadmin"
  restart = "unless-stopped"
  env = [
    "PGADMIN_DEFAULT_EMAIL=${var.pgadmin_email}",
    "PGADMIN_DEFAULT_PASSWORD=${var.pgadmin_password}"
  ]
  ports {
    internal = 80
    external = var.host_port
  }
  networks_advanced {
    name = var.network_id
    aliases = ["pgadmin"]
  }
}