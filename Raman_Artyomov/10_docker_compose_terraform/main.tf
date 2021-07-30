terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "service-nginx" {
  name = "nginx"
}

resource "docker_image" "service-sonarr" {
  name = "linuxserver/sonarr"
}

resource "docker_image" "service-radarr" {
  name = "linuxserver/radarr"
}

resource "docker_container" "nginx" {
  name = "nginx"
  image = docker_image.service-nginx.latest
  restart = "always"
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "/root/compose/1/app"
    read_only = "true"
  }
  ports {
    internal = "80"
    external = "80"
  }
}

resource "docker_container" "sonarr" {
  name = "sonarr"
  image = docker_image.service-sonarr.latest
  restart = "unless-stopped"
  env = [
    "PUOD=1000",
    "PGID=1000",
    "TZ=Europe/London"]
  volumes {
    container_path = "/config"
    host_path = "/root/compose/1/sonarr"
  }
  ports {
    internal = "8989"
    external = "8989"
  }
}

resource "docker_container" "radarr" {
  name = "radarr"
  image = docker_image.service-radarr.latest
  restart = "unless-stopped"
  env = [
    "PUOD=1000",
    "PGID=1000",
    "TZ=Europe/London"]
  volumes {
    container_path = "/config"
    host_path = "/root/compose/1/radarr"
  }
  ports {
    internal = "7878"
    external = "7878"
  }
}

