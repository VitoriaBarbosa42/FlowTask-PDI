# ==============================================================================
# FLOWTASK IAC — OUTPUTS & RESUMO DA INFRAESTRUTURA
# ==============================================================================

output "resumo_infraestrutura" {
  description = "Painel consolidado com todas as URLs, portas e serviços do FlowTask"
  value = {
    "1. PostgreSQL 15" = {
      host     = "localhost"
      port     = var.postgres_port
      database = var.postgres_db
      user     = var.postgres_user
    }
    "2. pgAdmin 4 (GUI)" = {
      url   = "http://localhost:${var.pgadmin_port}"
      email = var.pgadmin_email
    }
    "3. MongoDB 7.0" = {
      host     = "localhost"
      port     = var.mongo_port
      database = var.mongo_db
      user     = var.mongo_user
    }
    "4. Mongo Express (GUI)" = {
      url = "http://localhost:${var.mongo_express_port}"
    }
    "5. Redis 7 (Cache)" = {
      host = "localhost"
      port = var.redis_port
    }
    "6. Apache Kafka (KRaft)" = {
      bootstrap_host     = "localhost:${var.kafka_port}"
      bootstrap_internal = "flowtask-kafka:29092"
      mode               = "KRaft (Standalone Broker + Controller)"
    }
    "7. Keycloak IAM" = {
      url      = "http://localhost:${var.keycloak_port}"
      realm    = "flowtask"
      oidc_url = "http://localhost:${var.keycloak_port}/realms/flowtask/.well-known/openid-configuration"
    }
    "8. LocalStack AWS" = {
      endpoint  = "http://localhost:${var.localstack_port}"
      s3_bucket = module.localstack.s3_bucket_name
      sqs_dlq   = module.localstack.sqs_dlq_url
      secrets   = module.localstack.secrets_arn
    }
  }
}
