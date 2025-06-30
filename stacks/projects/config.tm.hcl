# Defaults for each project that can be overwritten in stacks below
globals {

  # The default acount ID to use: the stacks directory basename
  sa_account_id = terramate.stack.path.basename

  # The default display name of the Service Account: The name of the configured stack
  sa_display_name = terramate.name
}

##############################################################################
# Generate '_terramate_generated_service_account.tf' in each stack
# that has a global variable 'enable_service_account' set to true
# All globals will be replaced with the final value that is known by the stack
# Any terraform code can be defined within the content block
generate_hcl "_terramate_generated_project_factory.tf" {
  stack_filter {
    project_paths = [
      "/stacks/projects/*"
    ]
  }

  content {
    module "project" {
      source  = "terraform-google-modules/project-factory/google"
      version = "18.0"

      name = terramate.stack.name

      random_project_id = true
      org_id            = "400110290080"
      billing_account   = "01996F-DD7550-91BCAF"
    }
  }
}

generate_hcl "_terramate_generated_vpc.tf" {
  stack_filter {
    project_paths = [
      "/stacks/projects/*/vpc"
    ]
  }

  content {
    module "vpc" {
      source  = "terraform-google-modules/network/google"
      version = "11.1.0"

      project_id = module.project.project_id

      # sa_name         = terramate.globals.sa_display_name
      # sa_account_id   = terramate.globals.sa_account_id
      # sa_display_name = terramate.globals.sa_display_name
    }
  }
}

generate_hcl "_terramate_generated_subnet.tf" {
  stack_filter {
    project_paths = [
      "/stacks/projects/*/vpc/subnet"
    ]
  }

  content {
    module "subnet" {
      source  = "terraform-google-modules/network/google//modules/subnets"
      version = "11.1.0"

      project_id = module.project.project_id

      # sa_name         = terramate.globals.sa_display_name
      # sa_account_id   = terramate.globals.sa_account_id
      # sa_display_name = terramate.globals.sa_display_name
    }
  }
}