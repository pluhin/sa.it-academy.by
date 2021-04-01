### Docker compose
````
version: '3.8'

services: 
  webserver:
   image: nginx
   container_name: webserver
   ports: 
     - "127.0.0.1:81:80"
   volumes:
      - ./index.html:/usr/share/nginx/html/index.html:ro
   depends_on:
      - sonarr
      - radarr
   restart: unless-stopped
  sonarr:
    image: ghcr.io/linuxserver/sonarr
    container_name: sonarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - ./sonarr_data:/config
      - ./sonarr_tvseries:/tv
      - ./sonarr_downloads
    ports:
      - 8989:8989
    restart: unless-stopped
  radarr:
    image: ghcr.io/linuxserver/radarr
    container_name: radarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - ./radarr_data:/config
      - ./radarr_movies:/movies
      - ./radarr_downloads:/downloads
    ports:
      - 7878:7878
    restart: unless-stopped

````

### index.html for nginx

````
<!doctype html>
<html>
  <head>
    <title>Homework app</title>
  </head>
  <body>
      <h2></h2><a href="http://localhost:8989">Sonarr</a> </h2>
      <h2></h2><a href="http://localhost:7878">Radarr</a> </h2>
  </body>
</html>
````

### Terraform file

````
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
      external = 81
  }
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "/home/vagrant/06/hw"
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
    host_path = "/home/vagrant/06/hw"
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
    host_path = "/home/vagrant/06/hw"
    read_only = false
  }
 ````
 
