terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# 1. Imagem oficial do LocalStack (fixada na versão estável 3.8.0 Community)
resource "docker_image" "localstack" {
  name         = "localstack/localstack:3.8.0"
  keep_locally = true
}

# 2. Container LocalStack simulando S3, SQS e Secrets Manager
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

# 3. Bucket S3 para armazenamento de anexos de tarefas
resource "aws_s3_bucket" "attachments" {
  bucket = "flowtask-attachments"

  depends_on = [docker_container.localstack]
}

# 4. Fila SQS Dead Letter Queue (DLQ) para mensagens com falha
resource "aws_sqs_queue" "dlq" {
  name                      = "flowtask-deadletter-queue"
  message_retention_seconds = 86400

  depends_on = [docker_container.localstack]
}

# 5. Segredo no AWS Secrets Manager para variáveis sensíveis
resource "aws_secretsmanager_secret" "app_secrets" {
  name        = "flowtask-secrets"
  description = "Credenciais e secrets centrais da aplicação FlowTask"

  depends_on = [docker_container.localstack]
}

resource "aws_secretsmanager_secret_version" "app_secrets_val" {
  secret_id = aws_secretsmanager_secret.app_secrets.id
  secret_string = jsonencode({
    JWT_SECRET   = "seu-jwt-secret-super-seguro-32-chars-long"
    EXTERNAL_KEY = "flowtask-test-key-localstack"
  })

  depends_on = [docker_container.localstack]
}
