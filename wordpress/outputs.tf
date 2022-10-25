output "web_url" {
  description = "Web URL of the Wordpress application"
  value       = "http://localhost:${docker_container.wordpress.ports.0.external}"
}