# Docker network
module "network" {
  source = "./modules/network"
  prefix = var.prefix
}

# PHP application 1
module "app_1" {
  source       = "./modules/php"
  network_name = module.network.name
  nginx        = {
    repository = var.nginx_repository,
    tag        = var.nginx_tag,
    port       = 8080,
  }
  php = {
    repository      = var.php_repository,
    tag             = var.php_tag,
    app_folder_path = "apps/app-A",
  }
  worker_count = 1
}

# PHP application 2
module "app_2" {
  source       = "./modules/php"
  network_name = module.network.name
  nginx        = {
    repository = var.nginx_repository,
    tag        = var.nginx_tag,
    port       = 8081,
  }
  php = {
    repository      = var.php_repository,
    tag             = var.php_tag,
    app_folder_path = "apps/app-B",
  }
}