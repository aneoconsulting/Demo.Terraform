# Prefix used for all the resources
variable "prefix" {
  description = "Prefix used for all the resources"
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
