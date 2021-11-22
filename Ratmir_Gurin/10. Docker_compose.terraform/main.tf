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
  name   = "nginx">
  restart = "always"
  ports {
    internal = "80"
    external = "8001"
  }
  volumes {
    host_path = "/home/ratmir/git_temp/10.Docker.cpmpose.terraform"
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
    external = "8010"
  }
  volumes {
    host_path = "/home/ratmir/git_temp/10.Docker.cpmpose.terraform/sonarr"
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
    external = "8011"
  }
  volumes {
    host_path = "/home/ratmir/git_temp/10.Docker.cpmpose.terraform/radarr"
    container_path = "/config"
    read_only      = "false"
  }
}

