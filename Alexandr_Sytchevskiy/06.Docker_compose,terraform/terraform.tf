provider "docker" {}
resource "docker_image" "sonarr" {
    name = "linuxserver/sonarr"
}
resource "docker_image" "radarr" {
    name = "linuxserver/radarr"
}
resource "docker_image" "nginx" {
    name = "nginx"
}
resource "docker_volume" "nginx_data" {}

resource "docker_volume" "sonarr_config" {}

resource "docker_volume" "sonarr_tv" {}

resource "docker_volume" "sonarr_downloads" {}

resource "docker_volume" "radarr_config" {}

resource "docker_volume" "radarr_tv" {}

resource "docker_volume" "radarr_downloads" {}

resource "docker_network" "network" {
    name = "network"
}

resource "docker_container" "nginx" {
  name    = "nginx"
  image   = docker_image.nginx.latest
  restart = "always"
  volumes {
    volume_name    = docker_volume.nginx_data.name
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
  ports {
    internal = "80"
    external = "80"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}

resource "docker_container" "sonarr" {
  name    = "sonarr"
  image   = "${docker_image.sonarr.latest}"
  restart = "always"
  volumes {
    volume_name    = docker_volume.sonarr_config.name
    container_path = "/config"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.sonarr_tv.name
    container_path = "/tv"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.sonarr_downloads.name
    container_path = "/downloads"
    read_only      = false
  }
  ports {
    internal = "8989"
    external = "8989"
  }
  networks_advanced {
    name = docker_network.network.name
  }
depends_on = [docker_container.nginx]
}

resource "docker_container" "radarr" {
  name    = "radarr"
  image   = "${docker_image.radarr.latest}"
  restart = "always"
  volumes {
    volume_name    = docker_volume.radarr_config.name
    container_path = "/config"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.radarr_tv.name
    container_path = "/tv"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.radarr_downloads.name
    container_path = "/downloads"
    read_only      = false
  }
  ports {
    internal = "7878"
    external = "7878"
  }
  networks_advanced {
    name = docker_network.network.name
  }
depends_on = [docker_container.nginx]
}
