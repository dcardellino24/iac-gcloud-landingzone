# Organization-level configuration for digistore24.team
# This file contains global configurations and code generation templates
# that can be reused across all projects in this organization

globals {
  # Organization settings
  organization_id = "400110290080"
  billing_account = "01996F-DD7550-91BCAF"

  # Default regional settings
  default_region = "europe-west1"
  default_zones  = ["europe-west1-a", "europe-west1-b", "europe-west1-c"]

  # Common API services to enable across projects
  common_apis = [
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com"
  ]

  shared_vpc_host = true

  subnets = [
    {
      subnet_name   = "subnet-1"
      subnet_region = "europe-west1"
      subnet_ip     = "10.0.0.0/24"
    }
  ]
}

##############################################################################
# Provider Configuration for Project Factory
# Generates provider configuration for project factory stacks
generate_hcl "_terramate_generated_providers.tf" {
  stack_filter {
    project_paths = [
      "/stacks/organizations/digistore24.team/project-factory/*"
    ]
  }

  content {
    provider "google" {
      project = null
      region  = tm_try(global.region, global.default_region)
    }

    terraform {
      required_providers {
        google = {
          source  = "hashicorp/google"
          version = "~> 5.0"
        }
      }
      required_version = "~> 1.0"
    }
  }
}

##############################################################################
# Project Factory Template
# Generates project creation code for any stack in project-factory
generate_hcl "_terramate_generated_project_factory.tf" {
  stack_filter {
    project_paths = [
      "/stacks/organizations/digistore24.team/project-factory/*"
    ]
  }

  content {
    module "project" {
      source  = "terraform-google-modules/project-factory/google"
      version = "~> 17.0"

      name              = tm_basename(terramate.stack.path.absolute)
      random_project_id = true
      org_id            = global.organization_id
      billing_account   = global.billing_account

      activate_apis = concat(
        global.common_apis,
        tm_try(global.additional_apis, [])
      )

      default_service_account = "disable"

      enable_shared_vpc_host_project = global.enable_shared_vpc_host_project
    }
  }
}

generate_hcl "_terramate_generated_shared_vpc.tf" {
  stack_filter {
    project_paths = [
      "/stacks/organizations/digistore24.team/project-factory/*/shared-vpc"
    ]
  }

  content {
    module "shared_vpc" {
      source  = "terraform-google-modules/network/google//modules/vpc"
      version = "~> 11.1.1"

      project_id   = var.project_id
      network_name = "test"
      routing_mode = "REGIONAL"

      shared_vpc_host = global.shared_vpc_host
    }
  }
}

# generate_hcl "_terramate_generated_subnets.tf" {
#   stack_filter {
#     project_paths = [
#       "/stacks/organizations/digistore24.team/project-factory/*/shared-vpc/subnets"
#     ]
#   }

#   content {
#     module "subnets" {
#       source  = "terraform-google-modules/network/google//modules/subnets"
#       version = "~> 11.1.1"

#       network_name = var.network_name
#       project_id   = var.project_id

#       subnets = global.subnets
#     }
#   }
# }
