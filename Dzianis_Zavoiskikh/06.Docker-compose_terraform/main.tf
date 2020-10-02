terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
  required_version = ">= 0.13"
}

## Images

resource "docker_image" "httpd" {
  name = "httpd"
}
resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}
resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}

## Volumes

resource "docker_volume" "httpd_webdocs" {
  name        = "httpd_webdocs"
}

## Networks
resource "docker_network" "wp" {
  name = "wp_network"
}

## Contaners

resource "docker_container" "web" {
  image = docker_image.httpd.latest
  name  = "web"
  restart = "always"
  volumes {
  # if uncomment next line then the host_path will disable
  # volume_name = docker_volume.httpd_webdocs.name 
    host_path       = "/home/denis/tmp/html/"
    container_path  = "/usr/local/apache2/htdocs/"
    read_only = true
  }
  ports {
    internal = 80
    external = 8585
  }
}

resource "docker_container" "sonarr" {
  image = docker_image.sonarr.latest
  name  = "sonarr"
  restart = "always"
  volumes {
    host_path       = "/home/denis/tmp/sonarr/data"
    container_path  = "/config"
    read_only = false
 }
  volumes {
    host_path       = "/home/denis/tmp/sonarr/tvseries"
    container_path  = "/tv"
    read_only = false
 }
  volumes {
    host_path       = "/home/denis/tmp/sonarr/downloadclient-downloads"
    container_path  = "/downloads"
    read_only = false
 }
  ports {
    internal = 8989
    external = 8989
  }
}

resource "docker_container" "radarr" {
  image = docker_image.radarr.latest
  name  = "radarr"
  restart = "always"
  volumes {
    host_path       = "/home/denis/tmp/radarr/data"
    container_path  = "/config"
    read_only = false
  }
  volumes {
    host_path       = "/home/denis/tmp/radarr/movies"
    container_path  = "/movies"
    read_only = false
  }
  volumes {
    host_path       = "/home/denis/tmp/radarr/downloadclient-downloads"
    container_path  = "/downloads"
    read_only = false
  }
  ports {
    internal = 7878
    external = 7878
  }
}

