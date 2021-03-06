job "run-apps" {
  datacenters = ["dc1"]

  group "apps" {
    count = 1
    service {
      port = "5000"
    }
    network {
      port "ahttp" {
        static = 5000
      }
      port "bhttp" {
        static = 5001
      }
    }
    task "a" {
      driver = "docker"
      config {
        image = "orious/app-a-image"
        ports = ["ahttp"]
      }
    }
    task "b" {
      driver = "docker"
      config {
        image = "orious/app-b-image"
        ports = ["bhttp"]
      }
    }
  }
}
