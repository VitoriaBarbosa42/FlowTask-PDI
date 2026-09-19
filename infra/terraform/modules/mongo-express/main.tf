terraform {
    required_providers {
        docker = {
        source = "kreuzwerker/docker"
        }
    }
}

resource "docker_image" "mongo-express" {
  name = "mongo-express:latest"
  keep_locally = true
}

resource "docker_container" "mongo-express" {
  name = "flowtask-mongo-express"
  image = docker_image.mongo-express.image_id

  restart = "unless-stopped"

  env = [
    "ME_CONFIG_MONGODB_SERVER=${var.mongo_host}",
    "ME_CONFIG_MONGODB_PORT=27017",
    "ME_CONFIG_MONGODB_ENABLE_ADMIN=true",
    "ME_CONFIG_MONGODB_AUTH_DATABASE=admin",
    "ME_CONFIG_MONGODB_AUTH_USERNAME=${var.mongo_user}",
    "ME_CONFIG_MONGODB_AUTH_PASSWORD=${var.mongo_password}",
    "ME_CONFIG_BASICAUTH=false"
  ]

  ports {
    internal = 8081
    external = var.host_port
  }

  networks_advanced {
    name = var.network_id
    aliases = ["mongo-express"]
  }
}