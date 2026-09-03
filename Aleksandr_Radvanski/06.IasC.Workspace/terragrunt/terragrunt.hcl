include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../modules/proxmox-hosts"
}

inputs = {
  student_id = 1
  pool_id = "student-01"
  k3s_node_count = 1
  k8s_node_count = 2
  env_host_count = 2
}