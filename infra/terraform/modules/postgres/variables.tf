variable "database_name" {
    description = "Nome do banco principal"
    type = string
    default = "flowtask"
}

variable "database_user" {
    description = "Usuário master"
    type = string
    default = "postgres"
}

variable "database_password" {
    description = "Senha do banco"
    type = string
    default = "postgres"
    sensitive = true
}

variable "host_port" {
    description = "Porta externa no computador"
    type = number
    default = 5432
}

variable "network_id" {
    description = "Nome da rede Docker bridge onde o container será conectado."
    type = string
}

variable "data_dir" {
    description = "Caminho no host para persistência dos dados"
    type        = string
}
