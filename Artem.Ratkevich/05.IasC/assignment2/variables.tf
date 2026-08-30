variable "filename" {
  description = "Name of the file to create"
  type        = string
  default     = "pet_name.txt"

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]+$", var.filename))
    error_message = "Filename must contain only alphanumeric characters, dots, dashes, and underscores."
  }
}

variable "content_prefix" {
  description = "Prefix for the file content"
  type        = string
  default     = "Generated pet name: "
}

variable "pet_length" {
  description = "Number of words in the pet name"
  type        = number
  default     = 2

  validation {
    condition     = var.pet_length >= 1 && var.pet_length <= 5
    error_message = "pet_length must be between 1 and 5."
  }
}

variable "pet_separator" {
  description = "Separator between pet name words"
  type        = string
  default     = "-"
}

variable "api_key" {
  description = "API key for external service (sensitive)"
  type        = string
  sensitive   = true
}
