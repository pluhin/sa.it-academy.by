variable "File_petsname" {
  description = "Name files"
  type = string
  default = "petsname.txt"
}

variable "random_pet" {
  description = "length"
  type = number
  default = 3
}

variable "prefix" {
  description = "sensitive prefix"
  type =  string
  default = "work"
  sensitive = true
}

variable "environments" {
  type = map(object({
    pet_lenght = number
    prefix     = string
  }))

  description = "настройки разных сред окружения"
  default     = {
    dev = {
      pet_lenght = 2
      prefix     = "dev-work"
    }
    stage = {
      pet_lenght = 3
      prefix     = "stage-work"
    }
    prod = {
      pet_lenght = 4
      prefix     = "prod-work"
    }
  }
}