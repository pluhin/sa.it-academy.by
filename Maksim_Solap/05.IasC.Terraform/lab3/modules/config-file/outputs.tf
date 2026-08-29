output "full_hostname" {
  value       = "${var.prefix}-${random_pet.mod_pet.id}"
  description = "Сгенерированное полное имя хоста, собранное внутри модуля"
}
