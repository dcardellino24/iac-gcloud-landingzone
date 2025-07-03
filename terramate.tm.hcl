terramate {
  config {
    disable_safeguards = ["all"]

    experiments = [
      "outputs-sharing"
    ]

    cloud {
      organization = "digistore24"
    }
  }
}
