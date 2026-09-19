variable "pgadmin_email" {
  description = "Email do usuário administrador do pgAdmin"
  type        = string
  default = "admin@flowtask.com"
}

variable "pgadmin_password" {
  description = "Senha do usuário administrador do pgAdmin"
  type        = string
  sensitive = true
  default = "admin"
}

variable "host_port" {
  description = "Porta externa no navegador"
  type        = number
  default     = 5050
}

variable "network_id" {
  description = " Nome da rede bridge (flowtask-network)"
  type        = string
}
