resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}

resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}

resource "docker_image" "py_app" {
    name = "py_app:latest"
}
