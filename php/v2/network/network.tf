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


resource "docker_network" "private_network" {
  name = local.name
}