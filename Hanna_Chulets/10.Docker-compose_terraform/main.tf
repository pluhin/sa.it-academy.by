terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
    }
  }
}
provider "docker" {}

# Pulls the images
resource "docker_image" "nginx" {
  name = "nginx"
}

resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}

resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}

# Create the containers
resource "docker_container" "webserver" {
  image = docker_image.nginx.latest
  name  = "webserver"
  restart = "always"
  ports {
    internal = "80"
    external = "8080"
  }
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "/opt/git/hometasks/sa.it-academy.by/Hanna_Chulets/10.Docker-compose_terraform/app"
    read_only      = true
  }
}

resource "docker_container" "radarr" {
  image = docker_image.radarr.latest
  name  = "radarr"
  restart = "unless-stopped"
  env = ["PUID=1344","PGID=1344","TZ='Europe/London'"]
  ports {
    internal = "7878"
    external = "7878"
  }
  volumes {
    container_path = "/config"
    host_path = "/opt/git/hometasks/sa.it-academy.by/Hanna_Chulets/10.Docker-compose_terraform/config/radarr"
    read_only      = false
  }
  volumes {
    container_path = "/data"
    host_path = "/opt/git/hometasks/sa.it-academy.by/Hanna_Chulets/10.Docker-compose_terraform/data/radarr"
    read_only      = false
  }
}

resource "docker_container" "sonarr" {
  image = docker_image.sonarr.latest
  name  = "sonarr"
  restart = "unless-stopped"
  env = ["PUID=1344","PGID=1344","TZ='Europe/London'"]
  ports {
    internal = "8989"
    external = "8989"
  }
  volumes {
    container_path = "/config"
    host_path = "/opt/git/hometasks/sa.it-academy.by/Hanna_Chulets/10.Docker-compose_terraform/config/sonarr"
    read_only      = false
  }
  volumes {
    container_path = "/data"
    host_path = "/opt/git/hometasks/sa.it-academy.by/Hanna_Chulets/10.Docker-compose_terraform/data/sonarr"
    read_only      = false
  }
}