stack {
  name        = "shared-vpc"
  description = "shared-vpc"
  id          = "4c49286e-ac39-4abc-9fb8-eb428868b337"
}

input "project_id" {
  backend       = "terraform"
  value         = output.project_id.value
  from_stack_id = "4ca25ead-af60-4828-ba4a-4734041a226e"
  mock          = "mock-project-id"
}
