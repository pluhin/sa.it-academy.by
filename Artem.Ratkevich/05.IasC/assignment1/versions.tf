terraform {
  required_version = ">= 1.6.0"

  required_providers {
    local = {
      source  = "registry.opentofu.org/hashicorp/local"
      version = "~> 2.5.0"
    }
    random = {
      source  = "registry.opentofu.org/hashicorp/random"
      version = "~> 3.6.0"
    }
  }
}