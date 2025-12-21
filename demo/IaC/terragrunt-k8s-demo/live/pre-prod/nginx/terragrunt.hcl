include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

dependency "namespace" {
  config_path = "../namespace"

  mock_outputs = {
    name = "pre-prod"
  }

  mock_outputs_allowed_terraform_commands = ["plan"]
}

terraform {
  source = "../../../modules/nginx"
}

inputs = {
  namespace = dependency.namespace.outputs.name
  app_name  = "nginx-preprod"
  host      = "nginx-preprod.k8s-19.sa"
  replicas  = 2
}

