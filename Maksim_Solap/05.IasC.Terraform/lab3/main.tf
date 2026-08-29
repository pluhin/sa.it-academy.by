terraform {
  required_providers {
    local  = { source = "hashicorp/local" }
    random = { source = "hashicorp/random" }
  }
}

# Описываем конфигурацию наших окружений в виде коллекции (ключ = значение)
locals {
  environments = {
    dev   = "development-backend"
    stage = "staging-backend"
    prod  = "production-backend"
  }
}

# Динамически вызываем наш модуль для каждого элемента из locals.environments
module "config_environments" {
  source   = "./modules/config-file" # Путь к созданной нами папке модуля
  for_each = local.environments      # Запуск цикла по мапе

  # each.key — это ключ мапы (dev, stage, prod)
  # each.value — это значение мапы (development-backend, staging-backend, ...)
  env_name = each.key
  prefix   = each.value
}
