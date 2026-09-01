terraform {
  required_version = ">= 1.5"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~>2.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6.0"
    }
  }
}