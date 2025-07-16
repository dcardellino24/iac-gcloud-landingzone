stack {
  name        = "ds24-lz-demo"
  description = "ds24-lz-demo"
  id          = "3d11b9b1-d99e-41e0-8ba6-495d8b7fa9db"
}

output "project_id" {
  backend = "terraform"
  value   = module.project.project_id
}
