stack {
  name        = "vpc"
  description = "vpc"
  id          = "9c2333f6-4052-49ca-ac55-fee6b53c54b2"
}

globals {
  shared_vpc_host = true
}

input "project_id" {
  backend       = "terraform"
  value         = outputs.project_id.value
  from_stack_id = "c39b6faf-b5cf-42ef-8f10-319079794f19"
  mock          = "mock-project-id"
}

output "network_name" {
  backend = "terraform"
  value   = module.vpc.network_name
}
