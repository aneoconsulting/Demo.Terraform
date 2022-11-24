# Network
resource "docker_network" "network" {
  name = var.network_name
}

# PHP docker image
resource "docker_image" "php" {
  name = "${var.php_repository}:${var.php_tag}"
}

# PHP docker container
resource "docker_container" "php" {
  name         = "php"
  image        = docker_image.php.image_id
  restart      = "always"
  network_mode = docker_network.network.name
  mounts {
    type   = "bind"
    target = "/app"
    source = abspath(var.app_folder)
  }
}

# Nginx docker image
resource "docker_image" "nginx" {
  name = "${var.nginx_repository}:${var.nginx_tag}"
}

# Nginx docker container
resource "docker_container" "nginx" {
  name         = "nginx"
  image        = docker_image.nginx.image_id
  restart      = "always"
  network_mode = docker_network.network.name
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