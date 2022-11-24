resource "docker_image" "php" {
  name = "${var.php.repository}:${var.php.tag}"
}

resource "docker_container" "php" {
  count        = var.worker_count
  name         = "${local.prefix}-php-${count.index}"
  image        = docker_image.php.image_id
  restart      = "always"
  network_mode = var.network_name
  mounts {
    type   = "bind"
    target = "/app"
    source = abspath(var.php.app_folder_path)
  }
}