terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      ##version = "2.14.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "alpine" {
  name = "alpine"
}

resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}

resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}

resource "docker_container" "alpine" {
  name = "alpine"
  image = docker_image.alpine.latest
  provisioner "local-exec" {
    command = "apk update && apk add --no-cache nginx && adduser -D -g 'www' www && mkdir /www && mkdir -p /run/nginx/ && chown -R www:www /var/lib/nginx && chown -R www:www /www"
    }

  volumes {
    container_path = "/etc/nginx/nginx.conf"
    host_path = "/home/denis/Documents/Denis_Doubinin/10.Docker_compose/nginx.conf"
    read_only = false
  }

  volumes {
    container_path = "/www"
    host_path = "/home/denis/Documents/Denis_Doubinin/10.Docker_compose/index.html"
    read_only = true
  }

}


resource "docker_container" "sonarr" {
  name = "sonarr"
  image = docker_image.sonarr.latest
  ports {
    external = "8989"
    internal = "8989"
  }
}

resource "docker_container" "radarr" {
  name = "radarr"
  image = docker_image.radarr.latest
  ports {
    external = "7878"
    internal = "7878"
  }
}

