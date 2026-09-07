resource "random_pet" "pet_name" {
  length    = var.pet_length
  separator = var.pet_separator
}

resource "local_file" "pet_file" {
  filename = "${path.module}/${var.filename}"
  content  = "${var.content_prefix}${random_pet.pet_name.id}\nAPI Key: ${var.api_key}\n"
}
