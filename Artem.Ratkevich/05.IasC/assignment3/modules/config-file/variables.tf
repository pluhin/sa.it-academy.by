variable "filename" {
  description = "Name of the configuration file"
  type        = string
  
  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]+\\.(txt|cfg|conf|yml|yaml|json)$", var.filename))
    error_message = "Filename must be a valid configuration file with supported extension (.txt, .cfg, .conf, .yml, .yaml, .json)."
  }
}

variable "environment" {
  description = "Environment name (dev, stage, prod)"
  type        = string
  
  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be one of: dev, stage, prod."
  }
}

variable "pet_length" {
  description = "Number of words in pet name"
  type        = number
  default     = 2
}

variable "pet_separator" {
  description = "Separator between pet name words"
  type        = string
  default     = "-"
}

variable "api_key_length" {
  description = "Length of the generated API key"
  type        = number
  default     = 24
}

variable "custom_data" {
  description = "Custom key-value pairs to include in the config"
  type        = map(string)
  default     = {}
}
