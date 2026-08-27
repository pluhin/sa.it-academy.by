generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "proxmox" {}
EOF
}

inputs = {
  node_name = "pve"
  pool_id   = "SA"
}
