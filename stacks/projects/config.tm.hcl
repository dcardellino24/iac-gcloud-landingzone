# Defaults for each project that can be overwritten in stacks below
globals {

  # The default acount ID to use: the stacks directory basename
  sa_account_id = terramate.stack.path.basename

  # The default display name of the Service Account: The name of the configured stack
  sa_display_name = terramate.name
}

generate_hcl "_terramate_generated_subnet.tf" {
  content {
    module "subnet" {
      source  = "terraform-google-modules/network/google//modules/subnets"
      version = "11.1.0"

      network_name = var.network_name
      project_id   = var.project_id

      subnets = global.vpc.subnets
    }
  }
}

generate_hcl "_terramate_generated_cloud_nat.tf" {
  content {
    module "cloud_nat" {
      source  = "terraform-google-modules/cloud-nat/google"
      version = "5.3.0"

      name   = "ds24-${global.region_short}-${global.environment}"
      router = "ds24-${global.region_short}-${global.environment}"
      region = global.region

      project_id = var.project_id
    }
  }
}
