locals {
  nginx_conf = <<EOT
upstream php {
%{for i in range(var.php_count)~}
  server php-${i}:9000;
%{endfor~}
}
server {
  listen 8080 default_server;
  root /app;

  index index.php index.html index.htm;

  location ~ \.php$ {
    fastcgi_pass php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include fastcgi_params;
  }
}
EOT
}

# Network
resource "docker_network" "network" {
  name = var.network_name
}

# PHP docker image
resource "docker_image" "php" {
  name         = "${var.php_repository}:${var.php_tag}"
  keep_locally = true
}

# PHP docker container
resource "docker_container" "php" {
  count        = var.php_count
  name         = "php-${count.index}"
  image        = docker_image.php.image_id
  restart      = "always"
  network_mode = docker_network.network.name
  upload {
    file   = "/app/index.php"
    source = abspath(var.app_file)
  }
}

# Nginx docker image
resource "docker_image" "nginx" {
  name         = "${var.nginx_repository}:${var.nginx_tag}"
  keep_locally = true
}

# Nginx docker container
resource "docker_container" "nginx" {
  name         = "nginx"
  image        = docker_image.nginx.image_id
  restart      = "always"
  network_mode = docker_network.network.name
  upload {
    file    = "/etc/nginx/conf.d/server.conf"
    content = local.nginx_conf
  }
  upload {
    file   = "/app/index.php"
    source = abspath(var.app_file)
  }
  ports {
    external = var.nginx_port
    internal = 8080
  }
}
