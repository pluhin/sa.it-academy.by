variable "filename_prefix" {
  type        = string
  description = "Префикс для имени создаваемого файла"
  default     = "secure-pet"

  validation {
    condition     = length(var.filename_prefix) > 3
    error_message = "Префикс имени файла должен быть длиннее 3 символов."
  }
}

variable "secret_token" {
  type        = string
  description = "Секретный токен, который нельзя показывать в логах"
  sensitive   = true
}

variable "pet_length" {
  type        = number
  description = "Количество слов в имени питомца"
  default     = 2
}
