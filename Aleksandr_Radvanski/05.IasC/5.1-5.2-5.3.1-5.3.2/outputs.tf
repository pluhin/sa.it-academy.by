output "dev_source" {
  value = module.dev_config_files.source
}

output "dev_id" {
  value = module.dev_config_files.id
}

output "dev_permission" {
  value = module.dev_config_files.permission
}

output "stage_source" {
  value = module.stage_config_files.source
}

output "stage_id" {
  value = module.stage_config_files.id
}

output "stage_permission" {
  value = module.stage_config_files.permission
}

output "prod_source" {
  value = module.prod_config_files.source
}

output "prod_id" {
  value = module.prod_config_files.id
}

output "prod_permission" {
  value = module.prod_config_files.permission
}