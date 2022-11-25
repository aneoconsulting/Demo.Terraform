# Random string
resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
  numeric = true
}

locals {
  name = "${var.prefix}-${random_string.suffix.result}"
}

# Network
resource "docker_network" "network" {
  name = local.name
}