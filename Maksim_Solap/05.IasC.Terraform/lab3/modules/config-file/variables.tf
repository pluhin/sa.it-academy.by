variable "env_name" {
  type        = string
  description = "Имя окружения (например: dev, stage, prod)"
}

variable "prefix" {
  type        = string
  default     = "app"
  description = "Префикс для имени хоста приложения"
}
