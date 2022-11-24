locals {
    prefix = "${var.network_name}-${random_string.suffix.result}"
}

# Random string
resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
  numeric = true
}