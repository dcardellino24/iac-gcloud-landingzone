stack {
  name        = "ds24-digistore-dca"
  description = "ds24-digistore-dca"
  id          = "21492e88-5c18-4d47-b3fa-4265d1fa412c"
}

output "folder_id" {
  backend = "terraform"
  value   = module.folder.folder_id
}
