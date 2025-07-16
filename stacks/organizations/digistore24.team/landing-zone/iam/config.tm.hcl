globals {
  organization_iam = [
    {
      member = "domain:digistore24.team"
      roles = [
        "roles/resourcemanager.projectCreator",
        "roles/billing.creator"
      ]
    },
    {
      member = "user:dominic.cardellino@digistore24.team"
      roles = [
        "roles/owner",
        "roles/billing.admin",
        "roles/billing.projectManager"
      ]
    }
  ]
}
