variable "name" {
  description = "Логическое имя хоста (для local_name/outputs)"
  type        = string
}

variable "demo_id" {
  description = "Номер хоста (1..99): VMID = 990000+id, IP = subnet_prefix+id"
  type        = number
}

variable "hostname" {
  type = string
}

variable "node_name" {
  type    = string
  default = "pve"
}

variable "pool_id" {
  type    = string
  default = "SA"
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
  type    = number
  default = 4
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
  type    = number
  default = 16
}

variable "subnet_prefix" {
  type    = string
  default = "192.168.210."
}

variable "lxc_password" {
  type      = string
  default   = "DemoPass_123"
  sensitive = true
}
