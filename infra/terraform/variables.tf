# ==========================================
# PORTAS DOS SERVIÇOS (HOST)
# ==========================================

variable "postgres_port" {
  description = "Porta exposta no host para o PostgreSQL"
  type        = number
  default     = 5432
}

variable "pgadmin_port" {
  description = "Porta exposta no host para a interface web do pgAdmin 4"
  type        = number
  default     = 5050
}

variable "mongo_port" {
  description = "Porta exposta no host para o MongoDB"
  type        = number
  default     = 27017
}

variable "mongo_express_port" {
  description = "Porta exposta no host para a interface web do Mongo Express"
  type        = number
  default     = 8081
}

variable "redis_port" {
  description = "Porta exposta no host para o Redis"
  type        = number
  default     = 6379
}

variable "kafka_port" {
  description = "Porta exposta no host para o Apache Kafka (KRaft)"
  type        = number
  default     = 9092
}

variable "keycloak_port" {
  description = "Porta exposta no host para o Keycloak IAM"
  type        = number
  default     = 8080
}

variable "localstack_port" {
  description = "Porta exposta no host para o LocalStack (AWS Gateway)"
  type        = number
  default     = 4566
}

# ==========================================
# CREDENCIAIS E BANCOS DE DADOS
# ==========================================

variable "postgres_user" {
  description = "Usuário master do PostgreSQL"
  type        = string
  default     = "postgres"
}

variable "postgres_password" {
  description = "Senha do PostgreSQL"
  type        = string
  default     = "postgres"
  sensitive   = true
}

variable "postgres_db" {
  description = "Nome do banco de dados principal da aplicação FlowTask"
  type        = string
  default     = "flowtask"
}

variable "mongo_user" {
  description = "Usuário master do MongoDB"
  type        = string
  default     = "root"
}

variable "mongo_password" {
  description = "Senha do MongoDB"
  type        = string
  default     = "root"
  sensitive   = true
}

variable "mongo_db" {
  description = "Nome do banco de dados padrão do MongoDB"
  type        = string
  default     = "pdi"
}

variable "pgadmin_email" {
  description = "E-mail de login para o pgAdmin"
  type        = string
  default     = "admin@flowtask.com"
}

variable "pgadmin_password" {
  description = "Senha de login para o pgAdmin"
  type        = string
  default     = "admin"
  sensitive   = true
}

variable "keycloak_admin" {
  description = "Usuário administrador do Keycloak"
  type        = string
  default     = "admin"
}

variable "keycloak_admin_password" {
  description = "Senha do administrador do Keycloak"
  type        = string
  default     = "admin"
  sensitive   = true
}

# ==========================================
# GOVERNANÇA E PERSISTÊNCIA
# ==========================================

variable "clear_data_on_destroy" {
  description = "Se true, os dados persistidos em .docker/data serão limpos no destroy. Default: false (preserva dados)"
  type        = bool
  default     = false
}