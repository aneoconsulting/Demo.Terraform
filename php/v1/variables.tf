# Private network name
variable "network_name" {
  description = "Network name"
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

# Nginx port
variable "nginx_port" {
  description = "Nginx port"
  type        = number
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

# path of the PHP app file
variable "app_file" {
  description = "Path to the php application code"
  type        = string
}

# Number of PHP containers
variable "php_count" {
  description = "Number of PHP containers"
  type        = number
  default     = 3
}
