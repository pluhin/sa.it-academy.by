#Set provaider
terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

provider "docker" {}

# Set Images
resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}
resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}
resource "docker_image" "nginx" {
  name = "nginx_ser"
}

#Set network
resource "docker_network" "network" {
  name = "network"
}

#Set volumes
resource "docker_volume" "nginx_data" {
  name = "nginx_data"
}

#Set container
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "Nginx_terra"
  volumes {
    volume_name    = docker_volume.nginx_data.name
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }  
  ports {
    internal = 80
    external = 80
  }
  networks_advanced {
    name = docker_network.network.name
  }
  depends_on = [docker_container.sonarr, docker_container.radarr]
}

resource "docker_container" "sonarr" {
  name    = "sonarr"
  image   = docker_image.sonarr.latest
  restart = "always"
  ports {
    internal = "8989"
    external = "8989"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}

resource "docker_container" "radarr" {
  name    = "radarr"
  image   = docker_image.radarr.latest
  restart = "always"
  ports {
    internal = "7878"
    external = "7878"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}
