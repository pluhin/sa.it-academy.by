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


##Net

resource "docker_network" "net" {
  name = "net"
}

## Containers

resource "docker_container" "nginx1" {
  name    = "nginx1"
  image   = docker_image.nginx.latest
  restart = "always"
  ports {
    internal = "80"
    external = "8080"
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/vagrant/10.Docker-compose/nginx"
    read_only = true
  }
  networks_advanced {
    name = docker_network.net.name
  }
}

resource "docker_container" "sonarr1" {
  name    = "sonarr1"
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
    host_path = "/home/vagrant/10.Docker-compose/sonarr"
    read_only = false
  }
  networks_advanced {
    name = docker_network.net.name
  }
}

resource "docker_container" "radarr1" {
  name    = "radarr1"
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
    host_path = "/home/vagrant/10.Docker-compose/radarr"
    read_only = false
  }
  networks_advanced {
    name = docker_network.net.name
  }
}
