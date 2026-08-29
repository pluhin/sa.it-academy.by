output "generated_pet_name" {
  value       = random_pet.advanced_pet.id
  description = "Сгенерированное имя питомца"
}

output "file_path" {
  value       = local_file.advanced_file.filename
  description = "Путь к созданному файлу"
}

output "exposed_secret" {
  value     = var.secret_token
  sensitive = true # Обязательно, так как зависит от sensitive переменной
}
