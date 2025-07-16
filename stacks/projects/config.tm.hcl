# Defaults for each project that can be overwritten in stacks below
globals {

  # The default acount ID to use: the stacks directory basename
  sa_account_id = terramate.stack.path.basename

  # The default display name of the Service Account: The name of the configured stack
  sa_display_name = terramate.name
}

generate_hcl "_terramate_generated_vpc.tf" {
  stack_filter {
    project_paths = [
      "/stacks/projects/*/vpc"
    ]
  }

  content {
    module "vpc" {
      source  = "terraform-google-modules/network/google//modules/vpc"
      version = "~> 11.1.1"

      project_id   = var.project_id
      network_name = "test"
      routing_mode = "REGIONAL"

      shared_vpc_host = global.shared_vpc_host
    }
  }
}

generate_hcl "_terramate_generated_subnet.tf" {
  stack_filter {
    project_paths = [
      "/stacks/projects/*/vpc/subnets"
    ]
  }

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

# generate_hcl "_terramate_generated_cloud_nat.tf" {
#   stack_filter {
#     project_paths = [
#       "/stacks/projects/*/nat"
#     ]
#   }

#   content {
#     module "cloud_nat" {
#       source  = "terraform-google-modules/cloud-nat/google"
#       version = "5.3.0"

#       name   = "ds24-${global.google_region_short}-${global.environment}"
#       router = "ds24-${global.google_region_short}-${global.environment}"
#       region = global.google_region

#       project_id = var.project_id
#     }
#   }
# }

# generate_hcl "_terramate_generated_memorystore.tf" {
#   stack_filter {
#     project_paths = [
#       "/stacks/projects/*/memorystore"
#     ]
#   }

#   content {
#     module "memorystore" {
#       source  = "terraform-google-modules/memorystore/google"
#       version = "15.0.0"

#       name           = "ds24-${global.tenant}-${global.google_region_short}-${global.environment}"
#       region         = global.google_region
#       memory_size_gb = "1"

#       project_id = var.project_id
#     }
#   }
# }
