terraform {
  required_version = ">= 1.5.0"

  required_providers {
    # Provider para gerenciar containers e redes locais
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }

    # Provider AWS oficial, mas apontado para o LocalStack
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuração do Provider Docker
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Configuração do Provider AWS simulado via LocalStack
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3             = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
  }
}