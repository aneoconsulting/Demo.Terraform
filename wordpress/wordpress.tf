resource "docker_container" "wordpress" {
  name         = "wordpress"
  image        = "${var.wordpress_repository}:${var.wordpress_tag}"
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