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