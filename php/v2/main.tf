module "network" {
    source = "./network"
    prefix = var.prefix
}

module "app1" {
    source = "./php-app"
    network_name = module.network.name
    nginx = {
        repository = var.nginx_repository,
        tag        = var.nginx_tag,
        port       = 8080,
    }
    php = {
        repository      = var.php_repository,
        tag             = var.php_tag,
        app_folder_path = "app-A",
    }
    worker_count = 1
}

module "app2" {
    source = "./php-app"
    network_name = module.network.name
    nginx = {
        repository = var.nginx_repository,
        tag        = var.nginx_tag,
        port       = 8081,
    }
    php = {
        repository      = var.php_repository,
        tag             = var.php_tag,
        app_folder_path = "app-B",
    }
}