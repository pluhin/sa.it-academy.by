terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      ##version = "2.14.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "webserver_ter" {
  name = "nginx"
}
resource "docker_image" "radarr_ter" {
  name = "linuxserver/radarr"
}
resource "docker_image" "sonarr_ter" {
  name = "linuxserver/sonarr"
}

resource "docker_network" "network" {
  name = "network"
}


resource "docker_container" "webserver_ter" {
  name    = "webserver_ter"
  image   = docker_image.webserver_ter.latest
  restart = "always"
  volumes {
    container_path = "/usr/share/nginx/html/"
    host_path = "/home/ansible/demo/webapp/app"
    read_only      = false
  }
  ports {
    internal = "80"
    external = "8000"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}

resource "docker_container" "radarr_ter" {
  name    = "radarr_ter"
  image   = docker_image.radarr_ter.latest
  restart = "always"
  ports {
    internal = "7878"
    external = "8082"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}

resource "docker_container" "sonarr_ter" {
  name    = "sonarr_ter"
  image   = docker_image.sonarr_ter.latest
  restart = "always"
  ports {
    internal = "8989"
    external = "8081"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}
