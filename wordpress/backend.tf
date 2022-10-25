terraform {
  backend "local" {
    path          = "wordpress.tfstate"
    workspace_dir = "wordpress"
  }
}