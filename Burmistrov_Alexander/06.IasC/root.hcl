generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "proxmox" {}
EOF
}

inputs = {
  k3s_node_count = 1
  k8s_node_count = 2
  env_host_count = 2
}