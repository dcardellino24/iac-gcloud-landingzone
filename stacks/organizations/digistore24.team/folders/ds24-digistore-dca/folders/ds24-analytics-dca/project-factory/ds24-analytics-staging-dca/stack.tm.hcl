stack {
  name        = "ds24-analytics-staging-dca"
  description = "ds24-analytics-staging-dca"
  id          = "adfd2a57-c9ca-4bdb-9d3e-500a5a54e687"
}

input "folder_id" {
  backend       = "terraform"
  value         = outputs.folder_id.value
  from_stack_id = terramate.stack.parent.id
  mock          = "mock-folder-id"
}