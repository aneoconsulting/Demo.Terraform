terraform {
  backend "local" {
    path          = "php.tfstate"
    workspace_dir = "php"
  }
}
