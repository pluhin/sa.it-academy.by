# Включаем (наследуем) настройки из корневого root.hcl
include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Указываем, какой модуль разворачивать
terraform {
  source = "../modules/proxmox-hosts"
}

# Передаем только свои уникальные данные
inputs = {
  student_id = 4
  pool_id    = "student-04"
}