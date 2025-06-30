generate_hcl "backend.tf" {
  # condition = tm_alltrue([
  #   tm_can(tm_try(global.terraform.backend.azurerm, false)),
  #   !tm_contains(terramate.stack.tags, "no-backend")
  # ])

  content {
    terraform {
      backend "gcs" {
        bucket = global.terraform.backend.google.bucket_name
        prefix = "terraform/stacks/by-id/${terramate.stack.id}/terraform.tfstate"
      }
    }
  }
}