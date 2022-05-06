module "mongodb" {
  source                    = "./vendor/modules/mongodb"
  ENV                       = var.ENV
  WORKSTATION_IP            = var.WORKSTATION_IP
  DOCUMENTDB_PORT           = var.DOCUMENTDB_PORT
  DOCUMENTDB_INSTANCE_CLASS = var.DOCUMENTDB_INSTANCE_CLASS
  DOCUMENTDB_INSTANCE_COUNT = var.DOCUMENTDB_INSTANCE_COUNT
  SECRET_ID                 = aws_secretsmanager_secret.db-config.id
}

module "redis" {
  source                     = "./vendor/modules/redis"
  ENV                        = var.ENV
  ELASTICACHE_NODE_TYPE      = var.ELASTICACHE_NODE_TYPE
  ELASTICACHE_NODE_COUNT     = var.ELASTICACHE_NODE_COUNT
  ELASTICACHE_PORT           = var.ELASTICACHE_PORT
  ELASTICACHE_ENGINE_VERSION = var.ELASTICACHE_ENGINE_VERSION
}

module "mysql" {
  source             = "./vendor/modules/mysql"
  ENV                = var.ENV
  WORKSTATION_IP     = var.WORKSTATION_IP
  RDS_MYSQL_PORT     = var.RDS_MYSQL_PORT
  RDS_MYSQL_STORAGE  = var.RDS_MYSQL_STORAGE
  RDS_ENGINE_VERSION = var.RDS_ENGINE_VERSION
  RDS_INSTANCE_TYPE  = var.RDS_INSTANCE_TYPE
}

module "rabbitmq" {
  source                  = "./vendor/modules/rabbitmq"
  ENV                     = var.ENV
  RABBITMQ_PORT           = var.RABBITMQ_PORT
  RABBITMQ_ENGINE_VERSION = var.RABBITMQ_ENGINE_VERSION
  RABBITMQ_INSTANCE_TYPE  = var.RABBITMQ_INSTANCE_TYPE
}

resource "aws_secretsmanager_secret" "db-config" {
  name = "${var.ENV}/roboshop/db-config"
}
