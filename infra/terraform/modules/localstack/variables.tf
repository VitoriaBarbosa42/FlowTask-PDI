variable "host_port" {
  description = "Porta exposta no host para o LocalStack AWS Gateway"
  type        = number
  default     = 4566
}

variable "network_id" {
  description = "ID ou nome da rede Docker compartilhada (flowtask-network)"
  type        = string
}

variable "services" {
  description = "Lista de serviços AWS habilitados no LocalStack separados por vírgula"
  type        = string
  default     = "s3,sqs,secretsmanager"
}
