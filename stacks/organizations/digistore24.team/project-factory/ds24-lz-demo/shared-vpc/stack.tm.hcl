stack {
  name        = "shared-vpc"
  description = "shared-vpc"
  id          = "e9641c06-968b-43e6-9dd3-7cb64c32cf14"
}

input "project_id" {
  backend       = "terraform"
  value         = outputs.project_id.value
  from_stack_id = "3d11b9b1-d99e-41e0-8ba6-495d8b7fa9db"
  mock          = "mock-project-id"
}

output "network_name" {
  backend = "terraform"
  value   = module.vpc.network_name
}
