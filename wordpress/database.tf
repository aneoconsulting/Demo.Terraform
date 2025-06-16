# Database docker image
resource "docker_image" "db" {
  name         = "${var.db_repository}:${var.db_tag}"
  keep_locally = true
}

resource "docker_container" "db" {
  name         = "db"
  image        = docker_image.db.image_id
  restart      = "always"
  network_mode = docker_network.private_network.name
  mounts {
    type   = "volume"
    target = "/var/lib/mysql"
    source = docker_volume.vol_db.name
  }
  env = [
    "MYSQL_ROOT_PASSWORD=rootpassword",
    "MYSQL_DATABASE=${var.wordpress_db_name}",
    "MYSQL_USER=exampleuser",
    "MYSQL_PASSWORD=examplepass"
  ]
}
