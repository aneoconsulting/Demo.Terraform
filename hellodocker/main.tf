terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

resource "docker_container" "hello" {
  name    = "hello"
  image   = "alpine"
  command = ["tail", "-f", "/dev/null"]
}

output "container_id" {
  value = docker_container.hello.id
}
