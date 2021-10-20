terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      ##version = "2.14.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "drupal" {
  name = "drupal"
}
resource "docker_image" "mysql" {
  name = "mysql"
}

## Volumes
resource "docker_volume" "db_data" {
  name = "db_data"
}

resource "docker_network" "app" {
  name = "app_network"
}

resource "docker_container" "db" {
  name    = "db"
  image   = docker_image.mysql.latest
  restart = "always"
  volumes {
    volume_name    = docker_volume.db_data.name
    container_path = "/var/lib/mysql"
    read_only      = false
  }
  env = [
    "MYSQL_ROOT_PASSWORD=root_secret",
    "MYSQL_DATABASE=drupal",
    "MYSQL_USER=drupal",
    "MYSQL_PASSWORD=drupal"
  ]
  networks_advanced {
    name = docker_network.app.name
  }
}

resource "docker_container" "drupal" {
  name    = "drupal"
  image   = docker_image.drupal.latest
  restart = "always"
  ports {
    internal = "80"
    external = "8003"
  }
  networks_advanced {
    name = docker_network.app.name
  }
}
