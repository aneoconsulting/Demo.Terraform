resource "docker_image" "nginx" {
  name = "${var.nginx_repository}:${var.nginx_tag}"
}

resource "docker_container" "nginx" {
  name         = "nginx"
  image        = docker_image.nginx.image_id
  restart      = "always"
  network_mode = docker_network.private_network.name
  mounts {
    type   = "bind"
    target = "/etc/nginx/conf.d/server.conf"
    source = abspath(var.nginx_config_path)
  }
  mounts {
    type   = "bind"
    target = "/app"
    source = abspath(var.app_folder)

  }
  ports {
    external = var.nginx_port
    internal = 8080
  }
}
