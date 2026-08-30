# Development environment configuration
module "config_dev" {
  source = "./modules/config-file"

  filename       = "dev_app.cfg"
  environment    = "dev"
  pet_length     = 2
  pet_separator  = "-"
  api_key_length = 16

  custom_data = {
    "DEBUG"       = "true"
    "LOG_LEVEL"   = "debug"
    "MAX_RETRIES" = "3"
  }
}

# Staging environment configuration
module "config_stage" {
  source = "./modules/config-file"

  filename       = "stage_app.cfg"
  environment    = "stage"
  pet_length     = 3
  pet_separator  = "_"
  api_key_length = 24

  custom_data = {
    "DEBUG"         = "false"
    "LOG_LEVEL"     = "info"
    "MAX_RETRIES"   = "5"
    "REPLICA_COUNT" = "2"
  }
}

# Production environment with multiple instances using for_each
locals {
  prod_configs = {
    "web" = {
      filename      = "prod_web.cfg"
      pet_length    = 3
      pet_separator = "."
    }
    "api" = {
      filename      = "prod_api.cfg"
      pet_length    = 4
      pet_separator = "-"
    }
    "db" = {
      filename      = "prod_db.cfg"
      pet_length    = 2
      pet_separator = ":"
    }
  }
}

module "config_prod" {
  source   = "./modules/config-file"
  for_each = local.prod_configs

  filename       = each.value.filename
  environment    = "prod"
  pet_length     = each.value.pet_length
  pet_separator  = each.value.pet_separator
  api_key_length = 32

  custom_data = {
    "DEBUG"         = "false"
    "LOG_LEVEL"     = "warn"
    "MAX_RETRIES"   = "10"
    "REPLICA_COUNT" = "5"
    "SERVICE"       = each.key
    "REGION"        = "us-west-2"
  }
}
