provider "docker" {}

## Images
resource "docker_image" "nginx" {
  name = "nginx"
}
resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}
resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}

## Volumes
# resource "docker_volume" "nginx_data" {
#  name = "nginx_data"
# }

resource "docker_volume" "radarr_config" {
  name = "radarr_config"
}
resource "docker_volume" "radarr_movies" {
  name = "radarr_movies"
}
resource "docker_volume" "radarr_downloads" {
  name = "radarr_downloads"
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

## Networks
resource "docker_network" "app_network" {
  name = "app_network"
}

## Containers
resource "docker_container" "nginx"{
  name         = "nginx"
  image = docker_image.nginx.latest
  restart      = "always"
  volumes {
 #   volume_name    = docker_volume.nginx_data.name
#    container_path = "/usr/share/nginx/html"
#    host_path      = "/home/art/Terraform/html"
#    read_only      = false
#  }
# here changed !!!!!!!!!!!!!!!!!!

#    container_path = "/usr/share/nginx/html"
    container_path = "/usr/share/nginx/html"
    host_path      = "/home/user/work6/html"
    read_only      = false

  }

# here changed !!!!!!!!!!!!!!!!!!
  ports {
    internal = "80"
    external = "8080"
  }
  networks_advanced {
    name = docker_network.app_network.name
  }
  depends_on = [docker_container.radarr, docker_container.sonarr]
}

resource "docker_container" "radarr"{
  name         = "radarr"
  image = docker_image.radarr.latest
  restart      = "always"
  volumes {
    volume_name    = docker_volume.radarr_config.name
    container_path = "/config"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.radarr_movies.name
    container_path = "/movies"
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
    name = docker_network.app_network.name
  }
}
resource "docker_container" "sonarr"{
  name         = "sonarr"
  image = docker_image.sonarr.latest
  restart      = "always"
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
    name = docker_network.app_network.name
  }

}
