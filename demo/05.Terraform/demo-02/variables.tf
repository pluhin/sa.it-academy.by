variable "node_name" {
  description = "Нода Proxmox"
  type        = string
  default     = "pve"
}

variable "pool_id" {
  description = "Пул ресурсов Proxmox (должен существовать)"
  type        = string
  default     = "SA"
}

variable "demo_id" {
  description = "Номер демо-хоста (1..99). Задаёт VMID (990000+id) и последний октет IP."
  type        = number
  default     = 1

  validation {
    condition     = var.demo_id >= 1 && var.demo_id <= 99
    error_message = "demo_id должен быть в диапазоне 1..99."
  }
}

variable "hostname" {
  description = "Hostname контейнера"
  type        = string
  default     = "tf-demo"
}

variable "cores" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 512
}

variable "disk_size" {
  description = "Размер диска, ГиБ"
  type        = number
  default     = 4
}

variable "template" {
  type    = string
  default = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

variable "storage" {
  type    = string
  default = "local-st1"
}

variable "bridge" {
  type    = string
  default = "vmbr1"
}

variable "gateway" {
  type    = string
  default = "192.168.37.1"
}

variable "dns_server" {
  type    = string
  default = "8.8.8.8"
}

variable "netmask" {
  description = "Префикс плоской /16 сети лаборатории"
  type        = number
  default     = 16
}

variable "subnet_prefix" {
  description = "Префикс подсети; к нему добавляется demo_id"
  type        = string
  default     = "192.168.210."
}

variable "lxc_password" {
  description = "Root-пароль контейнера"
  type        = string
  default     = "DemoPass_123"
  sensitive   = true
}
