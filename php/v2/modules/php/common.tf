# Random string
resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
  numeric = true
}

locals {
  prefix    = "${var.network_name}-${random_string.suffix.result}"
  php_files = fileset(var.php.app_folder_path, "**")
  uploads = {
    for file in local.php_files:
      "/app/${file}" => file("${var.php.app_folder_path}/${file}")
  }
}
