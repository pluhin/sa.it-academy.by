include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../demo-03/modules/lab-host"
}

inputs = {
  name      = "prod-host"
  demo_id   = 31
  hostname  = "tf-prod"
  cores     = 2
  memory    = 1024
  disk_size = 8
}
