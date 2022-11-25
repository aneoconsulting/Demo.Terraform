# Network name
variable "network_name" {
  description = "Network name"
  type        = string
}

# Nginx configuration
variable "nginx" {
  description = "Nginx configuration"
  type        = object({
    repository = string,
    tag        = string,
    port       = number,
  })
  validation {
    condition     = var.nginx.port > 0 && var.nginx.port < 65536
    error_message = "Port number should be greater than 0 and lower than 65536"
  }
}

# PHP configuration
variable "php" {
  description = "PHP configuration"
  type        = object({
    repository      = string,
    tag             = string,
    app_folder_path = string,
  })
  validation {
    condition     = length(fileset(var.php.app_folder_path, "*")) > 0
    error_message = "App_folder_path: not found."
  }
}

# Number of PHP containers
variable "worker_count" {
  description = "Number of worker containers"
  type        = number
  default     = 3
}
