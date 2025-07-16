// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

provider "google" {
  project = var.project_id
  region  = "europe-west1"
}
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "< 7.0"
    }
  }
}
terraform {
  required_version = "~> 1.0"
}
