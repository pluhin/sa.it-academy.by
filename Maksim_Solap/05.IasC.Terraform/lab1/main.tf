resource "random_pet" "my_pet" {
  length    = 3
  separator = "-"
}

resource "local_file" "pet_file" {
  filename = "${path.module}/pet_name.txt"
  content  = "My awesome pet name is: ${random_pet.my_pet.id}\n"
}
