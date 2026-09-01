module "config_files" {
  source = "./modules/config-files"
  for_each = var.environments
  File_petsname = "${each.key}-${var.File_petsname}"
  random_pet = each.value.pet_lenght
  prefix = each.value.prefix
}