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

# Nginx docker image
resource "docker_image" "nginx" {
  name         = "${var.nginx.repository}:${var.nginx.tag}"
  keep_locally = true
}

# Nginx docker container
resource "docker_container" "nginx" {
  name         = "${local.prefix}-nginx"
  image        = docker_image.nginx.image_id
  restart      = "always"
  network_mode = var.network_name
  upload {
    file    = "/etc/nginx/conf.d/server.conf"
    content = local.nginx_conf
  }
  dynamic "upload" {
    for_each = local.php_files
    content {
      file   = "/app/${upload.key}"
      source = "${var.php.app_folder_path}/${upload.key}"
    }
  }
  ports {
    external = var.nginx.port
    internal = 8080
  }
}
