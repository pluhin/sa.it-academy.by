provider "docker" {}


resource "docker_container" "py_app" {
  name    = "py_app"
  image   = docker_image.py_app.latest
  ports {
    internal = "5000"
    external = "5000"
  }

  networks_advanced {
    name = docker_network.wp.name
  }

  depends_on = ["docker_container.sonarr", "docker_container.radarr"]
}

resource "docker_container" "sonarr" {
  name    = "sonarr"
  image   = docker_image.sonarr.latest
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
  ports {
    internal = "7878"
    external = "7878"
  }
    networks_advanced {
    name = docker_network.wp.name
  }
}