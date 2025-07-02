stack {
  name        = "sandbox-dc8"
  description = "sandbox-dc8"
  id          = "4ca25ead-af60-4828-ba4a-4734041a226e"
}

output "project_id" {
  backend = "terraform"
  value   = module.project.project_id
}

globals {
  enable_shared_vpc_host_project = false
}
