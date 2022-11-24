output "web_urls" {
  description = "Web URL of the PHP applications"
  value       = {
    app1 = module.app1.url,
    app2 = module.app2.url,
  }
}