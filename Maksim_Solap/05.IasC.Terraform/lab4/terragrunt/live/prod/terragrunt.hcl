include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../lab3/modules/config-file"
}

# Специфичные настройки для продуктовой среды (prod)
inputs = {
  env_name = "prod"
}
