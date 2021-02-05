terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.55.0"
    }
  }
}

provider "google" {
  credentials = file("apple-tree.json")
  project = "ppds-apple"
  region  = "asia-southeast1"
  zone    = "asia-southeast1-c"
}
