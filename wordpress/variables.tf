# Private network name
variable "private_network_name" {
  description = "Private network name"
  type        = string
}

# Persistent volume for DB
variable "vol_db_name" {
  description = "Persistent volume for DB name"
  type        = string
}

# Persistent volume for HTML
variable "vol_html_name" {
  description = "Persistent volume for HTML name"
  type        = string
}

# Docker image repository for DB
variable "db_repository" {
  description = "Docker image repository for DB"
  type        = string
}

# Docker image tag for DB
variable "db_tag" {
  description = "Docker image tag for DB"
  type        = string
}

# Wordpress DB name
variable "wordpress_db_name" {
  description = "Wordpress DB name"
  type        = string
}

# Docker image repository for Wordpress
variable "wordpress_repository" {
  description = "Docker image repository for Wordpress"
  type        = string
}

# Docker image tag for Wordpress
variable "wordpress_tag" {
  description = "Docker image tag for Wordpress"
  type        = string
}

# Wordpress port
variable "wordpress_port" {
  description = "Wordpress port"
  type        = number
}