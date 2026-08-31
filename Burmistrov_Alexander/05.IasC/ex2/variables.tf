locals {
  filename_password = "password.txt"
  filename_pet = "pet.txt"
  pet_prefix = "test_ex2"
  local_file_permission = "0600"
  full_path_password = "${path.module}/${local.filename_password}"
  full_path_pet = "${path.module}/${local.filename_pet}"
}

variable "read_password" {
  type = string
  sensitive = true
  validation {
    condition = length(var.read_password) > 4
    error_message = "The password must be longer than 4 characters"
  }
}