resource "docker_volume" "vol_db" {
  name = var.vol_db_name
}

resource "docker_volume" "vol_html" {
  name = var.vol_html_name
}