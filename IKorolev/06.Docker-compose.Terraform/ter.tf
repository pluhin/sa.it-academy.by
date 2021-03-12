provider "docker" {}
## Images
resource "docker_image" "sonarr" {
    name = "linuxserver/sonarr:latest"
}
resource "docker_image" "radarr" {
    name = "linuxserver/radarr:latest"
}
resource "docker_image" "nginx" {
    name = "nginx"
}

## Volumes and Network
resource "docker_volume" "nginx_data" {
  name = "nginx_data"
}

resource "docker_volume" "sonarr_config" {
  name = "sonarr_config"
}

resource "docker_volume" "sonarr_tv" {
  name = "sonarr_tv"
}

resource "docker_volume" "sonarr_downloads" {
  name = "sonarr_downloads"
}

resource "docker_volume" "radarr_config" {
  name = "radarr_config"
}

resource "docker_volume" "radarr_tv" {
  name = "radarr_tv"
}

resource "docker_volume" "radarr_downloads" {
  name = "radarr_downloads"
}

resource "docker_network" "network" {
  name = "network"
}

resource "docker_container" "nginx" {
  name    = "nginx"
  image   = docker_image.nginx.latest
  restart = "always"
  volumes {
    container_path = "/usr/share/nginx/html"
    read_only = false
    host_path = "/opt/.html/"
  }
  ports {
    internal = "80"
    external = "3000"
  }
  networks_advanced {
    name = docker_network.network.name
  }
depends_on = ["docker_container.sonarr", "docker_container.radarr"]
}

resource "docker_container" "sonarr" {
  name    = "sonarr"
  image   = "${docker_image.sonarr.latest}"
  restart = "always"
  volumes {
#   volume_name    = docker_volume.sonarr_config.name
    container_path = "/config"
    read_only      = false
    host_path = "/mnt/config"
  }
  volumes {
#   volume_name    = docker_volume.sonarr_tv.name
    container_path = "/tv"
    read_only      = false
    host_path = "/mnt/tv"
  }
  volumes {
#   volume_name    = docker_volume.sonarr_downloads.name
    container_path = "/downloads"
    read_only      = false
    host_path = "/mnt/sonarr_client"
  }
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
  image   = "${docker_image.radarr.latest}"
  restart = "always"
  volumes {
#   volume_name    = docker_volume.radarr_config.name
    container_path = "/config"
    read_only      = false
    host_path = "/mnt/radarr_config"
  }
  volumes {
#   volume_name    = docker_volume.radarr_tv.name
    container_path = "/movies"
    read_only      = false
    host_path = "/mnt/movies"
  }
  volumes {
    container_path = "/downloads"
    read_only      = false
    host_path = "/mnt/radarr_client"
  }
  ports {
    internal = "7878"
    external = "7878"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}
