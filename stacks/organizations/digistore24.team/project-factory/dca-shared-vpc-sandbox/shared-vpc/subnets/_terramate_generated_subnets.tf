// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

module "subnets" {
  network_name = var.network_name
  project_id   = var.project_id
  source       = "terraform-google-modules/network/google//modules/subnets"
  subnets = [
    {
      subnet_ip     = "10.0.0.0/24"
      subnet_name   = "subnet-1"
      subnet_region = "europe-west1"
    },
  ]
  version = "~> 11.1.1"
}
