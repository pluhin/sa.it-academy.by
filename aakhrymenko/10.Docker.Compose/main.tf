terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

## Images
resource "docker_image" "nginx" {
  name = "nginx"
}
resource "docker_image" "sonar" {
  name = "hotio/sonarr"
}
resource "docker_image" "radar" {
  name = "hotio/radarr"
}

## Volumes
resource "docker_volume" "nginx_data" {
  name = "nginx_data"
}
resource "docker_volume" "sonar_data" {
  name = "sonar_data"
}
resource "docker_volume" "radar_data" {
  name = "radar_data"
}

## Network
resource "docker_network" "net" {
  name = "net"
}

## Conteiner nginx
resource "docker_container" "nginx" {
  name    = "nginx"
  image   = docker_image.nginx.latest
  restart = "always"
  ports {
    internal = "80"
    external = "8001"
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/andrei/10.Docker-COmpose/homework/tera"
    read_only = true
  }
  networks_advanced {
    name = docker_network.net.name
  }
}

## Conteiner sonar
resource "docker_container" "sonar" {
  name    = "sonar"
  image   = docker_image.sonar.name
  restart = "always"
  ports {
    internal = "8989"
    external = "8100"
  }
   env = [
    "PUID=1000",
    "PGID=1000",
    "UMASK=002",
    "TZ=Etc/UTC"
  ]
  volumes {
    container_path  = "/config"
    host_path = "/home/andrei/10.Docker-COmpose/homework/tera/data_sonar"
    read_only = false
  }
  networks_advanced {
    name = docker_network.net.name
  }
}

## Conteiner radar
resource "docker_container" "radar" {
  name    = "radar"
  image   = docker_image.radar.name
  restart = "always"
  ports {
    internal = "7878"
    external = "8200"
  }
   env = [
    "PUID=1000",
    "PGID=1000",
    "UMASK=002",
    "TZ=Etc/UTC"
  ]
  volumes {
    container_path  = "/config"
    host_path = "/home/andrei/10.Docker-COmpose/homework/tera/data_radar"
    read_only = false
  }
  networks_advanced {
    name = docker_network.net.name
  }
}


