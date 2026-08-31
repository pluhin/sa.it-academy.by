output "deployed_hostnames" {
  value       = { for k, v in module.config_environments : k => v.full_hostname }
  description = "Сводная таблица сгенерированных хостнеймов по каждому окружению"
}
