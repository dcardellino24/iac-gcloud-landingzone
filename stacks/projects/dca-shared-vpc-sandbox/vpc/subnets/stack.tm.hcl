stack {
  name        = "subnets"
  description = "subnets"
  id          = "f4e600e3-046b-42c7-bf00-639a745f56af"
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
