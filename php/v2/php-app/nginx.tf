locals {
  nginx_conf = <<EOT
upstream php {
%{ for i in range(var.worker_count) ~}
  server ${local.prefix}-php-${i}:9000;
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
  filename = "${path.root}/generated/${local.prefix}-nginx.conf"
}

resource "docker_image" "nginx" {
  name = "${var.nginx.repository}:${var.nginx.tag}"
}

resource "docker_container" "nginx" {
  name         = "${local.prefix}-nginx"
  image        = docker_image.nginx.image_id
  restart      = "always"
  network_mode = var.network_name
  mounts {
    type   = "bind"
    target = "/etc/nginx/conf.d/server.conf"
    source = abspath(local_file.nginx_conf.filename)
  }
  mounts {
    type   = "bind"
    target = "/app"
    source = abspath(var.php.app_folder_path)

  }
  ports {
    external = var.nginx.port
    internal = 8080
  }
}
