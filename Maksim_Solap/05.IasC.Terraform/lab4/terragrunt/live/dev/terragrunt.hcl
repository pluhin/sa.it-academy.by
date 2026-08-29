# Подтягиваем (включаем) конфигурацию из родительского root.hcl
include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Указываем путь к нашему общему модулю из Лабораторной работы №3
terraform {
  source = "../../../lab3/modules/config-file"
}

# Специфичные настройки для среды разработки (dev)
inputs = {
  env_name = "dev"
}
