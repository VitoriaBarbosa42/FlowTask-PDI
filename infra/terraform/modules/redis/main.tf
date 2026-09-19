terraform {
    required_providers {
        docker = {
        source = "kreuzwerker/docker"
        }
    }
}

resource "docker_volume" "redis_data" {
  name = "flowtask-redis-data"
}

resource "docker_image" "redis" {
    name         = "redis:7-alpine"
    keep_locally = true
}

resource "docker_container" "redis" {
    image = docker_image.redis.image_id
    name  = "flowtask-redis"
    restart = "unless-stopped"
    command = ["redis-server", "--appendonly", "yes"]

    ports {
      internal = 6379
      external = var.host_port
    }

    networks_advanced {
      name = var.network_id
      aliases = ["redis"]
    }

    volumes {
      volume_name    = docker_volume.redis_data.name
      container_path = "/data"
    }
}