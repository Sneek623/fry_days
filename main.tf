terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
   project = "focal-road-417100"
   region = "uscentral-1"
   zone = "uscentral-1a"
   credentials = "focal-road-417100-20c1c507354c.json"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "auou-random-expiring-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
