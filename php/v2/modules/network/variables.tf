variable "prefix" {
  description = "Prefix for the name of the private network"
  type        = string
  validation {
    condition = can(regex("^[a-zA-Z][a-zA-Z0-9]*$", var.prefix))
    error_message = "Prefix must start with a letter and contain only alphanumeric characters."
  }
}