stack {
  name        = "subnets"
  description = "subnets"
  id          = "a9c0e697-fda7-4b9f-af09-d73a507ac8a6"
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
  from_stack_id = terramate.stack.parent.id
  mock          = "mock-network-name"
}
