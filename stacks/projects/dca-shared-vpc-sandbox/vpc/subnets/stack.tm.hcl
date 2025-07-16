stack {
  name        = "subnets"
  description = "subnets"
  id          = "d7681512-067e-456b-8e39-c31771d1b649"
}

input "project_id" {
  backend       = "terraform"
  value         = outputs.project_id.value
  from_stack_id = "c39b6faf-b5cf-42ef-8f10-319079794f19"
  mock          = "mock-project_id"
}

input "network_name" {
  backend       = "terraform"
  value         = outputs.network_name.value
  from_stack_id = "9c2333f6-4052-49ca-ac55-fee6b53c54b2"
  mock          = "mock-network-name"
}
