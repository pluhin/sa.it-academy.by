resource "random_pet" "pet_name" {
  length    = 2
  separator = "-"
}

resource "local_file" "pet_file" {
  filename = "${path.module}/pet_name.txt"
  content  = "Generated pet name: ${random_pet.pet_name.id}\n"
}