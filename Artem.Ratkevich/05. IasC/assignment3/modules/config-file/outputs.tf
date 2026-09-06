output "config_file_path" {
  description = "Path to the generated configuration file"
  value       = local_file.config_file.filename
}

output "pet_name" {
  description = "Generated pet name"
  value       = random_pet.pet_name.id
}

output "api_key" {
  description = "Generated API key (sensitive)"
  value       = random_password.api_key.result
  sensitive   = true
}

output "environment" {
  description = "Environment for this configuration"
  value       = var.environment
}
