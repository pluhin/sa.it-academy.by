resource "local_file" "insert_password" {
  content         = var.read_password
  filename        = local.full_path_password
  file_permission = local.local_file_permission
}

resource "random_pet" "server" {
  prefix = local.pet_prefix
}

resource "local_file" "insert_pet" {
  content  = random_pet.server.id
  filename = local.full_path_pet
}