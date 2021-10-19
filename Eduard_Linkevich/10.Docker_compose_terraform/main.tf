terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      ##version = "2.14.0"
    }
  }
}

provider "docker" {}


# Pulls the images
resource "docker_image" "apache2" {
  name = "ubuntu/apache2"
}

resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}

resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}


resource "docker_container" "apache2" {
  image = docker_image.apache2.latest
  name  = "apache2"
  restart = "always"
  ports {
    internal = "80"
    external = "8080"
  }
  volumes {
    container_path = "/var/www/html"
    host_path = "/home/eduard/10.Docker_compose_terraform"
    read_only      = true
  }
}


resource "docker_container" "radarr" {
  image = docker_image.radarr.latest
  name  = "radarr"
  restart = "unless-stopped"
  env = ["PUID=1000","PGID=1000","TZ='Europe/London'"]
  ports {
    internal = "7878"
    external = "7878"
  }
  volumes {
    container_path = "/data"
    host_path = "/home/eduard/10.Docker_compose_terraform/radarr"
    read_only      = false
  }
}

resource "docker_container" "sonarr" {
  image = docker_image.sonarr.latest
  name  = "sonarr"
  restart = "unless-stopped"
  env = ["PUID=1000","PGID=1000","TZ='Europe/London'"]
  ports {
    internal = "8989"
    external = "8989"
  }
  volumes {
    container_path = "/data"
    host_path = "/home/eduard/10.Docker_compose_terraform/sonarr"
    read_only      = false
  }
}