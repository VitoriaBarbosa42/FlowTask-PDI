
# ==============================================================================
# REDE PRIVADA DOCKER (BRIDGE)
# ==============================================================================
# Cria a rede dedicada onde todos os containers de banco de dados, mensageria,
# cache e simulação AWS se comunicarão via DNS interno do Docker.
# ==============================================================================

resource "docker_network" "flowtask_net" {
  name   = "flowtask-network"
  driver = "bridge"

  # Garante que a rede seja recriada de forma limpa se necessário
  check_duplicate = true
}


# ==============================================================================
# MÓDULO: POSTGRESQL 15
# ==============================================================================

module "postgres" {
  source = "./modules/postgres"
  database_name     = var.postgres_db
  database_user     = var.postgres_user
  database_password = var.postgres_password
  host_port         = var.postgres_port
  network_id        = docker_network.flowtask_net.name
  data_dir          = "${path.root}/../../.docker/data/postgres"
}

module "pgadmin" {
  source = "./modules/pgadmin"
  pgadmin_email    = var.pgadmin_email
  pgadmin_password = var.pgadmin_password
  host_port        = var.pgadmin_port
  network_id       = docker_network.flowtask_net.name
}

module "mongo" {
  source = "./modules/mongo"
  mongo_user     = var.mongo_user
  mongo_password = var.mongo_password
  mongo_db       = var.mongo_db
  host_port      = var.mongo_port
  network_id     = docker_network.flowtask_net.name
}

module "mongo-express" {
  source = "./modules/mongo-express"
  mongo_user     = var.mongo_user
  mongo_password = var.mongo_password
  host_port        = var.mongo_express_port
  network_id       = docker_network.flowtask_net.name
}

module "redis" {
  source = "./modules/redis"
  host_port  = var.redis_port
  network_id = docker_network.flowtask_net.name
}