terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

# 1. Imagem oficial do LocalStack
resource "docker_image" "localstack" {
  name         = "localstack/localstack:3.8.0"
  keep_locally = true
}

# 2. Container LocalStack simulando S3, SQS e SecretsManager
resource "docker_container" "localstack" {
  name    = "flowtask-localstack"
  image   = docker_image.localstack.image_id
  restart = "unless-stopped"

  ports {
    internal = 4566
    external = var.host_port
  }

  networks_advanced {
    name    = var.network_id
    aliases = ["localstack", "flowtask-localstack"]
  }

  env = [
    "SERVICES=${var.services}",
    "DEBUG=0",
    "DOCKER_HOST=unix:///var/run/docker.sock"
  ]

  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }
}
