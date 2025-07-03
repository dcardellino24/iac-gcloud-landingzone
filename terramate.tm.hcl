terramate {
  config {
    disable_safeguards = ["all"]

    experiments = ["scripts", "outputs-sharing"]
  }

    cloud {
      organization = "digistore24"
    }
  }
}
