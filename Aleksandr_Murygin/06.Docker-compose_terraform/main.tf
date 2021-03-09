provider "docker" {}

resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr:latest"
}
resource "docker_image" "nginx" {
  name = "nginx:latest"
}
resource "docker_image" "radarr" {
  name = "linuxserver/radarr:latest"
}
resource "docker_volume" "radarr_config" {
    name = "radarr_config"
}
resource "docker_volume" "radarr_movies" {
    name = "radarr_movies"
}
resource "docker_volume" "radarr_downloads" {
    name = "radarr_download"
}
resource "docker_container" "radarr" {
    image = "${docker_image.radarr.latest}"
    name = "radarr"
    restart = "always"
    ports {
    internal = 7878
    external = 7878
  }
volumes {
    volume_name = "${docker_volume.radarr_config.name}"
    container_path = "/config"
    host_path = "/home/aleks/terraform/5/radarr/config"
    read_only = false
  }
volumes {
    volume_name = "${docker_volume.radarr_movies.name}"
    container_path = "/movies"
    host_path = "/home/aleks/terraform/5/radarr/movies"
    read_only = false
  }
volumes {
    volume_name = "${docker_volume.radarr_downloads.name}"
    container_path = "/downloads"
    host_path = "/home/aleks/terraform/5/radarr/downloads"
    read_only = false
  }
}

resource "docker_container" "nginx" {
    image = "${docker_image.nginx.latest}"
    name = "nginx"
    restart = "always"
    depends_on = ["docker_container.sonarr", "docker_container.radarr"]
    ports {
    internal = 80
    external = 8000
  }

volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "/home/aleks/terraform/5/html"
    read_only = false
  }
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
resource "docker_container" "sonarr" {
    image = "${docker_image.sonarr.latest}"
    name = "sonarr"
    restart = "always"
    ports {
    internal = 8989
    external = 8989
  }
volumes {
    volume_name = "${docker_volume.sonarr_config.name}"
    container_path = "/config"
    read_only = false
    host_path = "/home/aleks/terraform/5/sonarr/config"
  }
volumes {
    volume_name = "${docker_volume.sonarr_tv.name}"
    container_path = "/tv"
    host_path = "/home/aleks/terraform/5/sonarr/tv"
    read_only = false
  }
volumes {
    volume_name = "${docker_volume.sonarr_downloads.name}"
    container_path = "/downloads"
    host_path = "/home/aleks/terraform/5/sonarr/downloads"
    read_only = false
  }
}
