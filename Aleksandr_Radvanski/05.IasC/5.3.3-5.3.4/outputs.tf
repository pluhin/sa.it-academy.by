output "all_files_source" {
  value       = {for env, mod in module.config_files : env => mod.source}
  description = "source для всех сред"
}
output "all_pet_names" {
  value = {for env, mod in module.config_files : env => mod.id }
  description = "Генерация имен животных для всех сред"
}