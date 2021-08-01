terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
    }
  }
}
provider "docker" {}

resource "docker_image" "lazylibrarian" {
  name = "linuxserver/lazylibrarian"
}


resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}

resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}

resource "docker_container" "lazylibrarian" {
  image = docker_image.lazylibrarian.latest
  name  = "lazylibrarian"
  restart = "unless-stopped"
  env = ["PUID=1000","PGID=1000","TZ='Europe/London'"]
  ports {
    internal = "5299"
    external = "5299"
  }
  volumes {
    container_path = "/config"
    host_path = "/home/vetton/docker/config/lazy"
    read_only      = false
  }
  volumes {
    container_path = "/downloads"
    host_path = "/home/vetton/docker/data/lazy"
    read_only      = false
  }
}


resource "docker_container" "radarr" {
  image = docker_image.radarr.latest
  name  = "radarr"
  restart = "unless-stopped"
  env = ["PUID=1000","PGID=1000","TZ='Europe/London'"]
  ports {
    internal = "7878"
    external = "7878"
  }
  volumes {
    container_path = "/config"
    host_path = "/home/vetton/docker/config/radarr"
    read_only      = false
  }
  volumes {
    container_path = "/data"
    host_path = "/home/vetton/docker/data/radarr"
    read_only      = false
  }
}

resource "docker_container" "sonarr" {
  image = docker_image.sonarr.latest
  name  = "sonarr"
  restart = "unless-stopped"
  env = ["PUID=1000","PGID=1000","TZ='Europe/London'"]
  ports {
    internal = "8989"
    external = "8989"
  }
  volumes {
    container_path = "/config"
    host_path = "/home/vetton/docker/config/sonarr"
    read_only      = false
  }
  volumes {
    container_path = "/data"
    host_path = "/home/vetton/docker/data/sonarr"
    read_only      = false
  }
}
