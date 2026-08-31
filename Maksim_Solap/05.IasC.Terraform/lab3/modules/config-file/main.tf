resource "random_pet" "mod_pet" {
  length = 2
}

resource "local_file" "mod_file" {
  # Переменная path.root указывает на КОРЕНЬ всего проекта (папку lab3),
  # поэтому все три файла от разных сред аккуратно соберутся в одной папке dist.
  filename = "${path.root}/dist/${var.env_name}-${var.prefix}-config.txt"
  content  = "Environment: ${var.env_name}\nGenerated Hostname: ${var.prefix}-${random_pet.mod_pet.id}\n"
}
