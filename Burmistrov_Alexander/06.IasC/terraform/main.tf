module "hosts" {
  source = "../modules/proxmox-hosts"

  student_id = var.student_id
  pool_id    = var.pool_id

  env_host_count = var.env_host_count
  k3s_node_count = var.k3s_node_count
  k8s_node_count = var.k8s_node_count

  start_containers = var.start_containers
  start_vms        = var.start_vms
}

output "ansible_target" {
  value = module.hosts.ansible_target
}

output "sandboxes" {
  value = module.hosts.sandboxes
}

output "k3s_nodes" {
  value = module.hosts.k3s_nodes
}

output "k8s_nodes" {
  value = module.hosts.k8s_nodes
}

output "inventory_table" {
  value = module.hosts.inventory_table
}
