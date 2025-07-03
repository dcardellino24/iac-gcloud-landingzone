// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

module "cloud_nat" {
  name       = "ds24-euw1-sandbox"
  project_id = var.project_id
  region     = "europe-west1"
  router     = "ds24-euw1-sandbox"
  source     = "terraform-google-modules/cloud-nat/google"
  version    = "5.3.0"
}
