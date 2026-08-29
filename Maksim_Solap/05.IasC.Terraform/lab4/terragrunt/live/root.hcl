# Блок генерации: автоматически создаст файл provider.tf в каждом окружении
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    local  = { source = "hashicorp/local" }
    random = { source = "hashicorp/random" }
  }
}
EOF
}

# Общие входные параметры (inputs), которые унаследуют и dev, и prod
inputs = {
  prefix = "enterprise-app"
}
