terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

#Containers init

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_image" "sonarr" {
  name         = "lscr.io/linuxserver/sonarr"
  keep_locally = false
} 

resource "docker_image" "radarr" {
  name         = "lscr.io/linuxserver/radarr"
  keep_locally = false
}


resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx"
  restart = "always"
  ports {
    internal = 80
    external = 8080
  }
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "/home/usr/docker/docker-compose/html"
    read_only = "true"
  }
}
resource "docker_container" "sonarr" {
  image = docker_image.sonarr.latest
  name  = "sonarr"
  restart = "unless-stopped"
  env = [
    "PUID=1000",
    "PGID=1000",
    "TZ=Europe/Minsk"]
  ports {
    internal = 8989
    external = 8989
  }
  volumes {
    container_path = "/config"
    host_path = "/home/usr/docker/docker-compose/data/sonarr"
    read_only = "false"
  }	
}
resource "docker_container" "radarr" {
  image = docker_image.radarr.latest
  name  = "redarr"
  restart = "unless-stopped"
  env = [
    "PUID=1000",
    "PGID=1000",
    "TZ=Europe/Minsk"]
  ports {
    internal = 7878
    external = 7878
  }
  volumes {
    container_path = "/config"
    host_path = "/home/usr/docker/docker-compose/data/radarr"
    read_only = "false"
  }	
}
