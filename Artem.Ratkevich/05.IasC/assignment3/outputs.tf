# Dev environment outputs
output "dev_pet_name" {
  description = "Dev environment pet name"
  value       = module.config_dev.pet_name
}

output "dev_config_path" {
  description = "Dev config file path"
  value       = module.config_dev.config_file_path
}

# Stage environment outputs
output "stage_pet_name" {
  description = "Stage environment pet name"
  value       = module.config_stage.pet_name
}

output "stage_config_path" {
  description = "Stage config file path"
  value       = module.config_stage.config_file_path
}

# Production environment outputs
output "prod_pet_names" {
  description = "Production pet names for all services"
  value = {
    for key, config in module.config_prod : key => config.pet_name
  }
}

output "prod_config_paths" {
  description = "Production config file paths"
  value = {
    for key, config in module.config_prod : key => config.config_file_path
  }
}

# Combined outputs for all environments
output "all_environments" {
  description = "Summary of all environment configurations"
  value = {
    dev   = module.config_dev.environment
    stage = module.config_stage.environment
    prod  = [for key, config in module.config_prod : key]
  }
}
