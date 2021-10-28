terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      ##version = "2.14.0"
    }
  }
}

provider "docker" {}


# Pulls the images
resource "docker_image" "apache2" {
  name = "ubuntu/apache2"
}

resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}

resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}

resource "docker_image" "qbittorrent" {
  name = "linuxserver/qbittorrent"
}

resource "docker_container" "apache2" {
  image = docker_image.apache2.latest
  name  = "apache2"
  restart = "always"
  ports {
    internal = "80"
    external = "8080"
  }
  volumes {
    container_path = "/var/www/html"
    host_path = "/Users/antonmovchan/downloads/git_repos/sa.it-academy.by/Anton_Usertiger/10.DOcker_compose/demo/1/"
    read_only      = true
  }
}


resource "docker_container" "radarr" {
  image = docker_image.radarr.latest
  name  = "radarr"
  restart = "unless-stopped"
  env = ["PUID=1000","PGID=1000","TZ='Europe/Kiev'"]
  ports {
    internal = "7878"
    external = "7878"
  }
  volumes {
    container_path = "/data"
    host_path = "/Users/antonmovchan/downloads/git_repos/sa.it-academy.by/Anton_Usertiger/10.DOcker_compose/demo/2/"
    read_only      = false
  }
}

resource "docker_container" "sonarr" {
  image = docker_image.sonarr.latest
  name  = "sonarr"
  restart = "unless-stopped"
  env = ["PUID=1000","PGID=1000","TZ='Europe/Kiev'"]
  ports {
    internal = "8989"
    external = "8989"
  }
  volumes {
    container_path = "/data"
    host_path = "/Users/antonmovchan/downloads/git_repos/sa.it-academy.by/Anton_Usertiger/10.DOcker_compose/demo/3/"
    read_only      = false
  }
}

resource "docker_container" "qbittorrent" {
  image = docker_image.qbittorrent.latest
  name  = "qbittorrent"
  restart = "unless-stopped"
  env = ["PUID=1000","PGID=1000","TZ='Europe/Kiev'"]
  ports {
    internal = "6068"
    external = "6881"
  }
  volumes {
    container_path = "/data"
    host_path = "/Users/antonmovchan/downloads/git_repos/sa.it-academy.by/Anton_Usertiger/10.DOcker_compose/demo/4/"
    read_only      = false
  }
}