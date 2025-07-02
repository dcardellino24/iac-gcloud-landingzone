stack {
  name        = "dca-shared-vpc-sandbox"
  description = "dca-shared-vpc-sandbox"
  id          = "f5ad8ef2-510b-4b08-abcc-3f9eb1b849da"
}

globals {
  environment  = "sandbox"
  region       = "europe-west1"
  region_short = "euw1"
  vpc = {
    subnets = [
      {
        subnet_name   = "subnet1"
        subnet_region = "us-central1"
        subnet_ip     = "10.0.0.0/24"
      },
    ]
  }
}

input "project_id" {
  backend       = "terraform"
  value         = output.project_id.value
  from_stack_id = "c39b6faf-b5cf-42ef-8f10-319079794f19"
  mock          = "mock-project-id"
}

input "network_name" {
  backend       = "terraform"
  value         = output.network_name.value
  from_stack_id = "aed39425-1598-4c03-a8a6-dfab54b12023"
  mock          = "mock-network-name"
}
