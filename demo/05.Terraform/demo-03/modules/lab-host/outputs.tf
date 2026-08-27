output "vm_id" {
  value = proxmox_virtual_environment_container.this.vm_id
}

output "ip" {
  value = "${var.subnet_prefix}${var.demo_id}"
}

output "hostname" {
  value = var.hostname
}
