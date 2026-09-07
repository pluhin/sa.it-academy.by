resource "random_pet" "pet_name" {
  length    = var.pet_length
  separator = var.pet_separator
}

resource "random_password" "api_key" {
  length           = var.api_key_length
  special          = true
  override_special = "!@#$%&*"
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
}

resource "local_file" "config_file" {
  filename = "${path.module}/${var.filename}"
  content = templatefile("${path.module}/../../templates/config.tpl", {
    pet_name     = random_pet.pet_name.id
    api_key      = random_password.api_key.result
    environment  = var.environment
    created_at   = timestamp()
    custom_data  = var.custom_data
  })
}
