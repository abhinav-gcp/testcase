# terraform/vm.tf
resource "google_compute_instance" "frontend" {
  name         = "frontend-vm"
  machine_type = "e2-medium"
  zone         = "asia-south2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    docker run -d -p 80:80 asia-south2-docker.pkg.dev/amplified-asset-426508-e7/my-docker-repo/frontend:latest
  EOF
}

resource "google_compute_instance" "backend" {
  name         = "backend-vm"
  machine_type = "e2-medium"
  zone         = "asia-south2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    docker run -d -p 3000:3000 asia-south2-docker.pkg.dev/amplified-asset-426508-e7/my-docker-repo/backend:latest
  EOF
}
