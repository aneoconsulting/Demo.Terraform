# Documentation:
# https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs



# Network
resource "docker_network" "network" {
  ...
}

# PHP docker image
resource "docker_image" "php" {
  ...
}

# PHP docker container
resource "docker_container" "php" {
  ...
}

# Nginx docker image
resource "docker_image" "nginx" {
  ...
}

# Nginx docker container
resource "docker_container" "nginx" {
  ...
}
