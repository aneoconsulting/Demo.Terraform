# PHP docker image
resource "docker_image" "php" {
  name         = "${var.php.repository}:${var.php.tag}"
  keep_locally = true
}

# PHP container
resource "docker_container" "php" {
  count        = var.worker_count
  name         = "${local.prefix}-php-${count.index}"
  image        = docker_image.php.image_id
  restart      = "always"
  network_mode = var.network_name

  dynamic "upload" {
    for_each = local.php_files
    content {
      file   = "/app/${upload.key}"
      source = "${var.php.app_folder_path}/${upload.key}"
    }
  }
}
