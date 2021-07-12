terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      ##version = "2.14.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_image" "sonarr" {
  name = "ghcr.io/linuxserver/sonarr"
}

resource "docker_image" "radarr" {
  name = "ghcr.io/linuxserver/radarr"
}

resource "docker_volume" "radarr_config" {
  name = "radarr_config"
}

resource "docker_volume" "sonarr_config" {
  name = "sonarr_config"
}

resource "docker_container" "nginx" {
    image = "${docker_image.nginx.latest}"
    name = "nginx"
    restart = "always"
    depends_on = [docker_container.sonarr, docker_container.radarr]
    ports {
      internal = 80
      external = 8000
  }
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "/home/alex/project/sa.it-academy.by/alex_kolyago/10.Docker-compose_terraform"
    read_only = false
  }
}

resource "docker_container" "sonarr" {
    image = "${docker_image.sonarr.latest}"
    name = "sonarr"
    restart = "always"
    ports {
      internal = 8989
      external = 8001
  }
  volumes {
    volume_name = "docker_volume.sonarr_config.name"
    container_path = "/config"
    host_path = "/home/alex/sonarr/config"
    read_only = false
  }
}

resource "docker_container" "radarr" {
    image = "${docker_image.radarr.latest}"
    name = "radarr"
    restart = "always"
    ports {
      internal = 7878
      external = 8002
  }
  volumes {
    volume_name = "docker_volume.radarr_config.name"
    container_path = "/config"
    host_path = "/home/alex//radarr/config"
    read_only = false
  }
}
