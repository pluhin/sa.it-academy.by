include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../demo-03/modules/lab-host"
}

inputs = {
  name     = "dev-host"
  demo_id  = 21
  hostname = "tf-dev"
  cores    = 1
  memory   = 512
}
