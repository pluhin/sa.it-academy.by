output "container_id" {
  description = "VMID созданного контейнера"
  value       = proxmox_virtual_environment_container.demo.vm_id
}

output "container_hostname" {
  value = var.hostname
}

output "container_ip" {
  description = "IP-адрес контейнера (без префикса сети)"
  value       = "${var.subnet_prefix}${var.demo_id}"
}
