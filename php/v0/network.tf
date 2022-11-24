resource "docker_network" "private_network" {
  name = var.private_network_name
}