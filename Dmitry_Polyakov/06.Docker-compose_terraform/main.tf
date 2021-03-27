provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
resource "docker_image" "sonarr" {
  name = "ghcr.io/linuxserver/sonarr"
}
resource "docker_image" "radarr" {
  name = "ghcr.io/linuxserver/radarr"
}
resource "docker_volume" "radarr_config" {
  name = "radarr_config"
}
resource "docker_volume" "sonarr_config" {
  name = "sonarr_config"
}
# nginx config
resource "docker_container" "nginx" {
    image = "${docker_image.nginx.latest}"
    name = "nginx"
    restart = "always"
    depends_on = [docker_container.sonarr, docker_container.radarr]
    ports {
      internal = 80
      external = 9001
  }
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "/root/docker-compose/06_hw/app"
    read_only = false
  }
}
# sonarr config
resource "docker_container" "sonarr" {
    image = "${docker_image.sonarr.latest}"
    name = "sonarr"
    restart = "always"
    ports {
      internal = 8989
      external = 8989
  }
  volumes {
    volume_name = "docker_volume.sonarr_config.name"
    container_path = "/config"
    host_path = "/root/docker-compose/06_hw/sonarr/config"
    read_only = false
  }
}
# radarr config
resource "docker_container" "radarr" {
    image = "${docker_image.radarr.latest}"
    name = "radarr"
    restart = "always"
    ports {
      internal = 7878
      external = 7878
  }
  volumes {
    volume_name = "docker_volume.radarr_config.name"
    container_path = "/config"
    host_path = "/root/docker-compose/06_hw/radarr/config"
    read_only = false
  }
}
