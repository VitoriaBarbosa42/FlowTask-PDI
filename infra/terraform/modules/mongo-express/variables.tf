variable "mongo_user" {
    description = "Usuário do MongoDB para autenticação."
    type        = string
    default     = "root"
}

variable "mongo_password" {
    description = "Senha do MongoDB para autenticação."
    type        = string
    default     = "root"
    sensitive = true
}

variable "mongo_host" {
    description = " Hostname do container do MongoDB na rede interna."
    type        = string
    default     = "mongo"
}

variable "host_port" {
    description = "Porta do host onde o container será exposto."
    type        = number
    default     = 8081
}

variable "network_id" {
    description = "Nome da rede Docker bridge onde o container será conectado."
    type        = string
}