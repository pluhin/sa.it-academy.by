provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}


locals {

  root_path = "/${replace(abspath(path.root), ":", "")}"
}

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

resource "docker_volume" "sonarr_client" {
  name = "sonarr_client"
}

resource "docker_volume" "radarr_config" {
  name = "radarr_config"
}

resource "docker_volume" "radarr_tv" {
  name = "radarr_tv"
}

resource "docker_volume" "rodarr_clietn" {
  name = "rodarr_clietn"
}

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
    read_only = false
    host_path = "${local.root_path}/html"
  }
  ports {
    internal = "80"
    external = "8001"
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
    volume_name    = docker_volume.sonarr_config.name
    container_path = "/config"
    read_only      = false
    host_path = "${local.root_path}/mnt/config"
  }
  volumes {
    volume_name    = docker_volume.sonarr_tv.name
    container_path = "/tv"
    read_only      = false
    host_path = "${local.root_path}/mnt/tv"
  }
  volumes {
    volume_name    = docker_volume.sonarr_client.name
    container_path = "/downloads"
    read_only      = false
    host_path = "${local.root_path}/mnt/sonarr_client"
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
    volume_name    = docker_volume.radarr_config.name
    container_path = "/config"
    read_only      = false
    host_path = "${local.root_path}/mnt/radarr_config"
  }
  volumes {
    volume_name    = docker_volume.radarr_tv.name
    container_path = "/movies"
    read_only      = false
    host_path = "${local.root_path}/mnt/movies"
  }
  volumes {
    volume_name    = docker_volume.rodarr_clietn.name
    container_path = "/downloads"
    read_only      = false
    host_path = "${local.root_path}/mnt/rodarr_clietn"
  }
  ports {
    internal = "7878"
    external = "7878"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}


