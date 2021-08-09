terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

##Images

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}
resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}

## Volumes

resource "docker_volume" "nginx_html" {
  name = "nginx_html"
}
resource "docker_volume" "sonarr_conf" {
  name = "sonarr_conf"
}
resource "docker_volume" "radarr_conf" {
  name = "radarr_conf"
}

##Net

resource "docker_network" "net" {
  name = "net"
}

## Containers

resource "docker_container" "nginx_" {
  name    = "nginx_"
  image   = docker_image.nginx.latest
  restart = "always"
  ports {
    internal = "80"
    external = "8080"
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/yunga/dockercompose/nginx_html"
    read_only = true
  }
  networks_advanced {
    name = docker_network.net.name
  }
}

resource "docker_container" "sonarr_" {
  name    = "sonarr_"
  image   = docker_image.sonarr.name
  restart = "always"
  ports {
    internal = "8989"
    external = "8090"
  }
   env = [
    "PUID=1000",
    "PGID=1000",
    "TZ=America/New_York"
  ]
  volumes {
    container_path  = "/config"
    host_path = "/home/yunga/dockercompose/sonarr_config"
    read_only = false
  }
  networks_advanced {
    name = docker_network.net.name
  }
}

resource "docker_container" "radarr_" {
  name    = "radarr_"
  image   = docker_image.radarr.name
  restart = "always"
  ports {
    internal = "7878"
    external = "8100"
  }
   env = [
    "PUID=1000",
    "PGID=1000",
    "TZ=America/New_York"
  ]
  volumes {
    container_path  = "/config"
    host_path = "/home/yunga/dockercompose/radarr_config"
    read_only = false
  }
  networks_advanced {
    name = docker_network.net.name
  }
}
