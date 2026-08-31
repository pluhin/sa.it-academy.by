resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "local_file" "insert_password" {
  content         = random_password.password.result
  filename        = "${path.module}/password.txt"
  file_permission = "0600"
}

resource "random_pet" "server" {
  prefix = "test"
}

resource "local_file" "insert_pet" {
  content  = random_pet.server.id
  filename = "${path.module}/pet.txt"
}
