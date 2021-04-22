provider "docker" {}

resource "docker_image" "webserver-tr" {
  name = "nginx"
}
resource "docker_image" "radarr-tr" {
  name = "linuxserver/radarr"
}
resource "docker_image" "sonarr-tr" {
  name = "linuxserver/sonarr"
}


resource "docker_network" "network" {
  name = "network"
}


resource "docker_container" "webserver-tr" {
  name    = "webserver-tr"
  image   = docker_image.webserver-tr.latest
  restart = "always"
  volumes {
    container_path = "/usr/share/nginx/html/"
    host_path = "/root/06.docker-compose/terraform/app/"
    read_only      = false
  }
  ports {
    internal = "80"
    external = "82"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}


resource "docker_container" "sonarr-tr" {
  name    = "sonarr-tr"
  image   = docker_image.sonarr-tr.latest
  restart = "always"
  ports {
    internal = "8989"
    external = "8989"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}

resource "docker_container" "radarr-tr" {
  name    = "radarr-tr"
  image   = docker_image.radarr-tr.latest
  restart = "always"
  ports {
    internal = "7878"
    external = "7878"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}





