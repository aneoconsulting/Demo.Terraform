# Wordpress docker image
resource "docker_image" "wordpress" {
  name         = "${var.wordpress_repository}:${var.wordpress_tag}"
  keep_locally = true
}

resource "docker_container" "wordpress" {
  name         = "wordpress"
  image        = docker_image.wordpress.image_id
  restart      = "always"
  network_mode = docker_network.private_network.name
  env          = [
    "WORDPRESS_DB_HOST=${docker_container.db.name}",
    "WORDPRESS_DB_USER=exampleuser",
    "WORDPRESS_DB_PASSWORD=examplepass",
    "WORDPRESS_DB_NAME=${var.wordpress_db_name}"
  ]
  ports {
    internal = "80"
    external = var.wordpress_port
  }
  mounts {
    type   = "volume"
    target = "/var/www/html"
    source = docker_volume.vol_html.name
  }
}
