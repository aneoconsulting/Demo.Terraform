output "web_url" {
  description = "Web URL of the PHP application"
  value       = "http://localhost:${docker_container.nginx.ports.0.external}"
}