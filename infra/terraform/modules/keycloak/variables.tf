variable "host_port" {
  description = "Porta exposta no host para a interface web e API do Keycloak"
  type        = number
  default     = 8080
}

variable "network_id" {
  description = "ID ou nome da rede Docker compartilhada (flowtask-network)"
  type        = string
}

variable "admin_user" {
  description = "Usuário master administrador do Keycloak"
  type        = string
  default     = "admin"
}

variable "admin_password" {
  description = "Senha master do administrador do Keycloak"
  type        = string
  default     = "admin"
  sensitive   = true
}

variable "database_name" {
  description = "Nome do banco de dados PostgreSQL do Keycloak"
  type        = string
  default     = "flowtask_keycloak"
}

variable "database_user" {
  description = "Usuário do banco de dados PostgreSQL"
  type        = string
  default     = "postgres"
}

variable "database_password" {
  description = "Senha do banco de dados PostgreSQL"
  type        = string
  default     = "postgres"
  sensitive   = true
}

variable "realm_file_path" {
  description = "Caminho absoluto ou relativo para o arquivo flowtask-realm.json"
  type        = string
}
