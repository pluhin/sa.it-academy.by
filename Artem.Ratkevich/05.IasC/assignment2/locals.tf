locals {
  timestamp = timestamp()

  formatted_content = "Generated on ${local.timestamp}\n${local_file.pet_file.content}"

  file_size = fileexists(var.filename) ? length(file(var.filename)) : 0

  pet_name_upper = upper(random_pet.pet_name.id)
}
