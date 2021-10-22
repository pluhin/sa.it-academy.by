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
resource "docker_image" "sonarr" {
  name = "lscr.io/linuxserver/sonarr"
  keep_locally = "true"
}
resource "docker_image" "radarr" {
  name = "lscr.io/linuxserver/radarr"
  keep_locally = "true"
}

resource "docker_container" "nginx" {
  image    = docker_image.nginx.latest
  name   = "nginx"
  restart = "always"
  ports {
    internal = "80"
    external = "81"
  }
  volumes {
    host_path = "/home/vagrant/doooo/docker_compose/1/nginx"
    container_path = "/usr/share/nginx/html"
    read_only      = "true"
  }

}

resource "docker_container" "sonarr" {
  image    = docker_image.sonarr.latest
  name   = "sonarr"
  restart = "unless-stopped"
  ports {
    internal = "8989"
    external = "8989"
  }
  env = [
    "PUID=1000",
    "PGID=1000",
    "TZ=Europe/Minsk"
  ]
  volumes {
    host_path = "/home/vagrant/doooo/docker_compose/1/sonarr"
    container_path = "/config"
    read_only      = "false"
  }
}

resource "docker_container" "radarr" {
  image    = docker_image.radarr.latest
  name   = "radarr"
  restart = "unless-stopped"
  ports {
    internal = "7878"
    external = "7878"
  }
  env = [
    "PUID=1000",
    "PGID=1000",
    "TZ=Europe/Minsk"
  ]
  volumes {
    host_path = "/home/vagrant/doooo/docker_compose/1/radarr"
    container_path = "/config"
    read_only      = "false"
  }
}

