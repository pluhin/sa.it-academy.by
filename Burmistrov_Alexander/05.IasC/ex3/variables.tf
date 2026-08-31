variable "get_env" {
    type = list(string)
    default = ["dev", "stage", "prod"]
}

variable "env_pass" {
    type = list(string)
    sensitive = true
    default = ["dev", "stage", "prod"]
}

locals {
    default_env_path = "${path.module}"
}

variable "env_path" {
    type = string
}
