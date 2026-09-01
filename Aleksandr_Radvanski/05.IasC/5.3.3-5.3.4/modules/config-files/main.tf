locals {
  dynamic_separetor = var.random_pet > 2 ? "-" : "_"
}
resource "random_pet" "Pet" {
  length    = var.random_pet
  separator = local.dynamic_separetor
  prefix    = var.prefix
}

resource "local_file" "Pet_name" {
  filename = "${path.root}/${var.File_petsname}"
  content  = "Имя моего питомца: ${random_pet.Pet.id}\n"
}