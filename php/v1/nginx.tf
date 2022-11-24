locals {
  nginx_conf = <<EOT
upstream php {
%{ for i in range(var.php_count) ~}
  server php-${i}:9000;
%{ endfor ~}
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

resource "local_file" "nginx_conf" {
  content  = local.nginx_conf
  filename = "${path.root}/generated/nginx.conf"
}

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
    source = abspath(local_file.nginx_conf.filename)
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
