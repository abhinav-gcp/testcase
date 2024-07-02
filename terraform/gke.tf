# terraform/gke.tf
provider "google" {
  project = "amplified-asset-426508-e7"
  region  = "asia-south2"
}

resource "google_container_cluster" "primary" {
  name     = "gke-cluster"
  location = "asia-south2-a"

  node_config {
    machine_type = "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  initial_node_count = 1
}
