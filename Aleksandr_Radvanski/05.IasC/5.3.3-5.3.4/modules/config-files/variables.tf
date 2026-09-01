variable "File_petsname" {
  description = "Name files"
  type = string
}

variable "random_pet" {
  description = "length"
  type = number
}

variable "prefix" {
  description = "sensitive prefix"
  type =  string
  sensitive = true
}