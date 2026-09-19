variable "host_port" {
  description = "Porta exposta no host para o broker Kafka (PLAINTEXT_HOST)"
  type        = number
  default     = 9092
}

variable "network_id" {
  description = "ID ou nome da rede Docker compartilhada (flowtask-network)"
  type        = string
}

variable "cluster_id" {
  description = "Cluster ID em Base64 exigido para inicialização do Kafka em modo KRaft"
  type        = string
  default     = "MkU3OEVBNTcwNTJENDM2Qk"
}
