module "web" {
  source = "./modules/lab-host"

  name     = "web"
  demo_id  = 11
  hostname = "tf-web"
  memory   = 512
}

module "db" {
  source = "./modules/lab-host"

  name      = "db"
  demo_id   = 12
  hostname  = "tf-db"
  memory    = 1024
  disk_size = 6
}

output "web" {
  value = {
    id = module.web.vm_id
    ip = module.web.ip
  }
}

output "db" {
  value = {
    id = module.db.vm_id
    ip = module.db.ip
  }
}
