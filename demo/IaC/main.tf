terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  # host = "unix:///var/run/docker.sock"  # при необходимости можно раскомментировать
}

## Images
resource "docker_image" "drupal" {
  # Лучше явно указать тег
  name = "drupal:10.0.0"
}

resource "docker_image" "mysql" {
  # И здесь тоже
  name = "mysql:5.7"
}

## Volumes
resource "docker_volume" "db_data" {
  name = "db_data"
}

## Network
resource "docker_network" "wp" {
  name = "wp_network"
}

resource "docker_container" "db" {
  name    = "db"
  image   = docker_image.mysql.image_id   # было: docker_image.mysql.latest
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
    "MYSQL_PASSWORD=drupal",
  ]

  networks_advanced {
    name = docker_network.wp.name
  }
}

resource "docker_container" "drupal" {
  name    = "drupal"
  image   = docker_image.drupal.image_id  # было: docker_image.drupal.latest
  restart = "always"

  ports {
    internal = 80    # было "80"
    external = 8080  # было "8080"
  }

  volumes {
    container_path = "/tmp"
    read_only      = false
    host_path      = "/tmp"
  }

  networks_advanced {
    name = docker_network.wp.name
  }
}

