stack {
  name        = "dca-shared-vpc-sandbox"
  description = "dca-shared-vpc-sandbox"
  id          = "c39b6faf-b5cf-42ef-8f10-319079794f19"
}

output "project_id" {
  backend = "terraform"
  value   = module.project.project_id
}

globals {
  enable_shared_vpc_host_project = true
}
