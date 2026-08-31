module "dev_config_files" {
  source = "./modules/config-files"
  File_petsname = "dev-${var.File_petsname}"
  random_pet = 2
  prefix = "dev-${var.prefix}"
}

module "stage_config_files" {
  source = "./modules/config-files"
  File_petsname = "stage-${var.File_petsname}"
  random_pet = 3
  prefix = "stage-${var.prefix}"
}

module "prod_config_files" {
  source = "./modules/config-files"
  File_petsname = "prod-${var.File_petsname}"
  random_pet = 4
  prefix = "prod-${var.prefix}"
}