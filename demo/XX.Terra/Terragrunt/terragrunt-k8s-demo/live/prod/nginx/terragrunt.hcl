include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

dependency "namespace" {
  config_path = "../namespace"

  mock_outputs = {
    name = "prod"
  }

  mock_outputs_allowed_terraform_commands = ["plan"]
}

terraform {
  source = "../../../modules/nginx"
}

inputs = {
  namespace = dependency.namespace.outputs.name
  app_name  = "nginx-prod"
  host      = "nginx-prod.k8s-9.sa"
  replicas  = 3
}

