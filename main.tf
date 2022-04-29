module "mongodb" {
  source = "./vendor/modules/mongodb"
  ENV    = var.ENV
}

module "redis" {
  source = "./vendor/modules/redis"
  ENV    = var.ENV
}

module "mysql" {
  source = "./vendor/modules/mysql"
  ENV    = var.ENV
}

