variable "mongo_user" {
    description = "Usuario root do MongoDB"
    type        = string
    default     = "root"
}

variable "mongo_password" {
    description = "Senha do usuario root do MongoDB"
    type        = string
    default     = "root"
    sensitive   = true
}

variable "mongo_db" {
    description = "Nome do banco principal"
    type        = string
    default     = "pdi"
}

variable "host_port" {
    description = "Porta externa no computador host"
    type        = number
    default     = 27017
}

variable "network_id" {
    description = "Nome da rede Docker bridge onde o container será conectado (flowtask-network)."
    type        = string
  
}