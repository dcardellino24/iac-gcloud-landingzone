// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "google_organization" "organization" {
  domain = "digistore24.team"
}
module "folder" {
  display_name = "ds24-analytics-dca"
  parent       = data.google_organization.organization.name
  source       = "github.com/mineiros-io/terraform-google-folder.git?ref=v0.2.0"
}
