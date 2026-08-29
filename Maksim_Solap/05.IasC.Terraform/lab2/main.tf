terraform {
  required_providers {
    local  = { source = "hashicorp/local" }
    random = { source = "hashicorp/random" }
  }
}

locals {
  # Вычисляемое значение: преобразуем префикс в верхний регистр и добавляем суффикс времени
  computed_filename = "${upper(var.filename_prefix)}-CONFIG.txt"
}

resource "random_pet" "advanced_pet" {
  length = var.pet_length
}

resource "local_file" "advanced_file" {
  filename = "${path.module}/${local.computed_filename}"
  content  = "Token: ${var.secret_token}\nPet name: ${random_pet.advanced_pet.id}\n"
}
