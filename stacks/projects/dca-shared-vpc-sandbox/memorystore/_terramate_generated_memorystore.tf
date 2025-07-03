// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

module "memorystore" {
  memory_size_gb = "1"
  name           = "ds24-money-euw1-sandbox"
  project_id     = var.project_id
  region         = "europe-west1"
  source         = "terraform-google-modules/memorystore/google"
  version        = "15.0.0"
}
