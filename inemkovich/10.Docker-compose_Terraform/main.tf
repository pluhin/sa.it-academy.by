terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}


## Images
resource "docker_image" "nginx" {
  name = "nginx:latest"
}
resource "docker_image" "radarr" {
  name = "ghcr.io/linuxserver/radarr:latest"
}
resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr:latest"
}
## Nginx Volume
resource "docker_volume" "nginx_index" {
  name = "nginx_index"
}
## Radarr Volumes
resource "docker_volume" "radarr_config" {
    name = "radarr_config"
}
resource "docker_volume" "radarr_downloads" {
    name = "radarr_downloads"
}
resource "docker_volume" "radarr_movies" {
    name = "radarr_movies"
}
## Sonarr Volumes
resource "docker_volume" "sonarr_config" {
  name = "sonarr_config"
}
resource "docker_volume" "sonarr_downloads" {
  name = "sonarr_downloads"
}
resource "docker_volume" "sonarr_tv" {
  name = "sonarr_tv"
}
## Nginx container
resource "docker_container" "nginx" {
  image = "${docker_image.nginx.latest}"
  name = "nginx"
  restart = "always"
  depends_on = [docker_container.radarr, docker_container.sonarr]
  ports {
    internal = 80
    external = 8080
  }
  volumes {
    volume_name    = docker_volume.nginx_index.name
    host_path      = "/home/igor/Documents/it-academy.by/10.Docker-compose_Terraform/nginx/"
    container_path = "/usr/share/nginx/html"
    read_only      = false
    
  }  
}
## Radarr container
resource "docker_container" "radarr" {
  image = "${docker_image.radarr.latest}"
  name = "radarr"
  ports {
    internal = 7878
    external = 7878
  }
  env = [
    "PUID=1000"
    "PGID=1000"
    "UMASK=002"
    "TZ=Europe/London"
  ]
  volumes {
    volume_name    = docker_volume.radarr_config.name
    host_path = "/home/igor/Documents/it-academy.by/10.Docker-compose_Terraform/radarr/config/"
    container_path = "/config"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.radarr_movies.name
    host_path = "/home/igor/Documents/it-academy.by/10.Docker-compose_Terraform/radarr/movies/"
    container_path = "/movies"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.radarr_downloads.name
    host_path = "/home/igor/Documents/it-academy.by/10.Docker-compose_Terraform/radarr/downloads/"
    container_path = "/downloads"
    read_only      = false
  }
}

## Sonarr container
resource "docker_container" "sonarr" {
  image = "${docker_image.sonarr.latest}"
  name = "sonarr"
  ports {
    internal = 8989
    external = 8989
  }
  env = [
    "PUID=1000"
    "PGID=1000"
    "UMASK=002"
    "TZ=Europe/London"
  ]
  volumes {
    volume_name    = docker_volume.sonarr_config.name
    host_path = "/home/igor/Documents/it-academy.by/10.Docker-compose_Terraform/sonarr/config/"
    container_path = "/config"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.sonarr_tv.name
    host_path = "/home/igor/Documents/it-academy.by/10.Docker-compose_Terraform/sonarr/tv/"
    container_path = "/tv"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.sonarr_downloads.name
    host_path = "/home/igor/Documents/it-academy.by/10.Docker-compose_Terraform/sonarr/downloads/"
    container_path = "/downloads"
    read_only      = false
  }
}