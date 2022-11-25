output "web_urls" {
  description = "Web URL of the PHP applications"
  value       = {
    app_1 = module.app_1.url,
    app_2 = module.app_2.url,
  }
}