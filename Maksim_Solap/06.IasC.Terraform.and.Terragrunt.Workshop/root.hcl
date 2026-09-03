generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "proxmox" {
  # Все настройки провайдер возьмет из ваших export PROXMOX_VE_...
}
EOF
}