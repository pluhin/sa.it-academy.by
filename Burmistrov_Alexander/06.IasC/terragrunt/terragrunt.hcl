include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../modules/proxmox-hosts"
}

inputs = {
  student_id     = 3
  pool_id = "student-03"
}