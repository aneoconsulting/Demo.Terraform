terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

resource "docker_container" "hello" {
  name    = "hello"
  image   = "alpine"
  command = ["sleep", "infinity"]
}

output "container_id" {
  value = docker_container.hello.id
}
