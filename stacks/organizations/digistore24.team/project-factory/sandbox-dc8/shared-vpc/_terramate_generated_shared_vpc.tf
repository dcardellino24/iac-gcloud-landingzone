// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

module "shared_vpc" {
  network_name    = "test"
  project_id      = var.project_id
  routing_mode    = "REGIONAL"
  shared_vpc_host = true
  source          = "terraform-google-modules/network/google//modules/vpc"
  version         = "~> 11.1.1"
}
