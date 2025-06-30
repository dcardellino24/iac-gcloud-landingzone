stack {
  name        = "shared-vpc"
  description = "shared-vpc"
  id          = "aed39425-1598-4c03-a8a6-dfab54b12023"
}

globals {
  enable_shared_vpc_host_project = true
}

output "vpc_id" {
  backend = "terraform"
  value   = module.shared_vpc.network_name
}

input "project_id" {
  backend       = "terraform"
  value         = output.project_id.value
  from_stack_id = "c39b6faf-b5cf-42ef-8f10-319079794f19"
  mock          = "mock-project-id"
}
