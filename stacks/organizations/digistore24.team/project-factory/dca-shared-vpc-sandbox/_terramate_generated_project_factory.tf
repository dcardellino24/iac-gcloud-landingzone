// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

module "project" {
  activate_apis = concat([
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    ], [
  ])
  billing_account         = "01996F-DD7550-91BCAF"
  default_service_account = "keep"
  name                    = "dca-shared-vpc-sandbox"
  org_id                  = "400110290080"
  random_project_id       = true
  source                  = "terraform-google-modules/project-factory/google"
  version                 = "~> 17.0"
}
