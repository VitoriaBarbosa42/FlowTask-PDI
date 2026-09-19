terraform {
    required_providers {
        docker = {
        source = "kreuzwerker/docker"
        }
    }
}

resource "docker_volume" "mongo_data" {
  name = "flowtask_mongo_data"
}

resource "docker_image" "mongo" {
  name = "mongo:7.0"
  keep_locally = true
}

resource "docker_container" "mongo" {
  image = docker_image.mongo.name
  name  = "flowtask_mongo"
  restart = "unless-stopped"
  env = [
    "MONGO_INITDB_ROOT_USERNAME=${var.mongo_user}",
    "MONGO_INITDB_ROOT_PASSWORD=${var.mongo_password}",
    "MONGO_INITDB_DATABASE=${var.mongo_db}"
  ]
  ports {
    internal = 27017
    external = var.host_port
  }
  networks_advanced {
    name = var.network_id
    aliases = ["mongo"]
  }
  volumes {
    volume_name = "${docker_volume.mongo_data.name}"
    container_path = "/data/db"
  }
}
