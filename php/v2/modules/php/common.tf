# Random string
resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
  numeric = true
}

locals {
    prefix       = "${var.network_name}-${random_string.suffix.result}"
    php_app_path = abspath(var.php.app_folder_path)
}