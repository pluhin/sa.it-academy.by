locals {
  filename_password = "password.txt"
  filename_pet = "pet.txt"
  pet_prefix = "test_${var.environment}"
  local_file_permission = "0640"
  full_path_password = "${var.path}/${var.environment}/${local.filename_password}"
  full_path_pet = "${var.path}/${var.environment}/${local.filename_pet}"
}

variable "read_password" {
  type = string
  sensitive = true
  validation {
    condition = length(var.read_password) > 0
    error_message = "The password must not be empty."
  }
}

variable "environment" {
    type = string
    validation {
    condition = length(var.environment) > 0
    error_message = "Name environment must not be empty."
  }
}

variable "path"{
    type = string
    validation {
    condition = length(var.path) > 0
    error_message = "Path environment must not be empty."
    }
}