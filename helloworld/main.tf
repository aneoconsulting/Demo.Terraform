variable "world" {
  type = string
}

output "hello" {
  value = "Hello ${var.world}"
}
