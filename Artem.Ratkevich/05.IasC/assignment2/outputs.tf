output "pet_name" {
  description = "The generated pet name"
  value       = random_pet.pet_name.id
}

output "pet_name_uppercase" {
  description = "Pet name in uppercase"
  value       = local.pet_name_upper
}

output "file_path" {
  description = "Path to the created file"
  value       = local_file.pet_file.filename
}

output "api_key" {
  description = "API key (sensitive)"
  value       = var.api_key
  sensitive   = true
}
