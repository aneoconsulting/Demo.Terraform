# Private network name
variable "private_network_name" {
  description = "Private network name"
  type        = string
}

# Docker image repository for Nginx
variable "nginx_repository" {
  description = "Docker image repository for Nginx"
  type        = string
}

# Docker image tag for Nginx
variable "nginx_tag" {
  description = "Docker image tag for Nginx"
  type        = string
}

# Docker image repository for PHP
variable "php_repository" {
  description = "Docker image repository for PHP"
  type        = string
}

# Docker image tag for PHP
variable "php_tag" {
  description = "Docker image tag for php"
  type        = string
}

# folder of the PHP app
variable "app_folder" {
  description = "Path to the php application code"
  type        = string
}

# Nginx port
variable "nginx_port" {
  description = "Nginx port"
  type        = number
}

# Nginx config path
variable "nginx_config_path" {
  description = "Nginx config path"
  type        = string
}
