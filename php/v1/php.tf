resource "docker_image" "php" {
  name = "${var.php_repository}:${var.php_tag}"
}

resource "docker_container" "php" {
  count        = var.php_count
  name         = "php-${count.index}"
  image        = docker_image.php.image_id
  restart      = "always"
  network_mode = docker_network.private_network.name
  mounts {
    type   = "bind"
    target = "/app"
    source = abspath(var.app_folder)
  }
}