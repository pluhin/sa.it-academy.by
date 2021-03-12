## Docker-compose

```
version: "3.8"
services:

  web_server:
    image: nginx
    container_name: nginx
    volumes: 
    - ./index.html:/usr/share/nginx/html/index.html:ro
    ports:
    - "127.0.0.1:81:80"
    depends_on:
      - sonarr
      - radarr
    restart: unless-stopped

  sonarr:
    image: ghcr.io/linuxserver/sonarr
    container_name: sonarr
    volumes:
      - ./sonarr_data:/config
      - ./sonarr_tvseries:/tv
      - ./sonarr_downloads:/downloads
    ports:
      - 8989:8989
    restart: unless-stopped

  radarr:
    image: ghcr.io/linuxserver/radarr
    container_name: radarr
    volumes:
      - ./radarr_data:/config
      - ./radarr_movies:/movies
      - ./radarr_downloads:/downloads
    ports:
      - 7878:7878
    restart: unless-stopped
```

## terraform

```
provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx"
}
resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}
resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}

resource "docker_network" "wp" {
  name = "wp_network"
}

resource "docker_volume" "sonarr_data" {
  name = "sonarr_data"
}
resource "docker_volume" "sonarr_tvseries" {
  name = "sonarr_tvseries"
}
resource "docker_volume" "sonarr_downloads" {
  name = "sonarr_downloads"
}
resource "docker_volume" "radarr_data" {
    name = "radarr_data"
}
resource "docker_volume" "radarr_movies" {
    name = "radarr_movies"
}
resource "docker_volume" "radarr_downloads" {
    name = "radarr_download"
}


resource "docker_container" "nginx" {
  name    = "nginx"
  image   = docker_image.nginx.latest
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path      = "/index.html"
    read_only      = false
  }
  ports {
    internal = "80"
    external = "81"
  }
  networks_advanced {
    name = docker_network.wp.name
  }
  depends_on = [docker_container.radarr, docker_container.sonarr]
}

resource "docker_container" "sonarr" {
  name    = "sonarr"
  image   = docker_image.sonarr.latest
  restart = "always"
  volumes {
    volume_name    = docker_volume.sonarr_data.name
    container_path = "/config"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.sonarr_tvseries.name
    container_path = "/sonarr_tvseries"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.sonarr_downloads.name
    container_path = "/sonnar_downloads"
    read_only      = false
  }
  ports {
    internal = "8989"
    external = "8989"
  }
  networks_advanced {
    name = docker_network.wp.name
  }
}

resource "docker_container" "radarr" {
  name    = "radarr"
  image   = docker_image.radarr.latest
  restart = "always"
  volumes {
    volume_name    = docker_volume.radarr_data.name
    container_path = "/config"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.radarr_movies.name
    container_path = "/radarr_movies"
    read_only      = false
  }
  volumes {
    volume_name    = docker_volume.radarr_downloads.name
    container_path = "/radarr_downloads"
    read_only      = false
  }
  ports {
    internal = "7878"
    external = "7878"
  }
  networks_advanced {
    name = docker_network.wp.name
  }
}
```