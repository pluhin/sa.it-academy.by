output "env_name" {
    value = module.gen_config_file[*].env_name
    description = "Name environment"
}

output "filename_password" {
    value = module.gen_config_file[*].filename_password
    description = "Full path to the file password values"
}

output "pet" {
    value = module.gen_config_file[*].pet
    description = "Full path to the file random_pet values"
}

output "password" {
    value = module.gen_config_file[*].password
    sensitive = true
    description = "Sensistive output password"
}

output "pet_name" {
    value = module.gen_config_file[*].pet_name
    description = "Pet name"
}