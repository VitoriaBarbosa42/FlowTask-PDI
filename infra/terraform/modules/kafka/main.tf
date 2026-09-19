terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "kafka" {
  name         = "confluentinc/cp-kafka:7.5.0"
  keep_locally = true
}

resource "docker_container" "kafka" {
  name    = "flowtask-kafka"
  image   = docker_image.kafka.image_id
  restart = "unless-stopped"

  ports {
    internal = 9092
    external = var.host_port
  }

  networks_advanced {
    name    = var.network_id
    aliases = ["kafka", "flowtask-kafka"]
  }

  env = [
    "KAFKA_NODE_ID=1",
    "KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT",
    "KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://flowtask-kafka:29092,PLAINTEXT_HOST://localhost:${var.host_port}",
    "KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:29092,CONTROLLER://0.0.0.0:29093,PLAINTEXT_HOST://0.0.0.0:9092",
    "KAFKA_INTER_BROKER_LISTENER_NAME=PLAINTEXT",
    "KAFKA_CONTROLLER_LISTENER_NAMES=CONTROLLER",
    "KAFKA_CONTROLLER_QUORUM_VOTERS=1@flowtask-kafka:29093",
    "KAFKA_PROCESS_ROLES=broker,controller",
    "KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS=0",
    "KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1",
    "KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=1",
    "KAFKA_TRANSACTION_STATE_LOG_MIN_ISR=1",
    "KAFKA_LOG_DIRS=/tmp/kraft-combined-logs",
    "CLUSTER_ID=${var.cluster_id}"
  ]
}
