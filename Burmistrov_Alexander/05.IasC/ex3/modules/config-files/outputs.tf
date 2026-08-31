output "env_name" {
    value = var.environment
    description = "Name environment"
}

output "filename_password" {
    value = local.full_path_password
    description = "Full path to the file password values"
}

output "pet" {
    value = local.full_path_pet
    description = "Full path to the file random_pet values"
}

output "password" {
    value = var.read_password
    sensitive = true
    description = "Sensistive output password"
}

output "pet_name" {
    value = random_pet.server.id
    description = "Pet name"
}
