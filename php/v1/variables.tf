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

# Number of PHP containers
variable "php_count" {
  description = "Number of PHP containers"
  type        = number
  default     = 3
}

# Nginx port
variable "nginx_port" {
  description = "Nginx port"
  type        = number
}
