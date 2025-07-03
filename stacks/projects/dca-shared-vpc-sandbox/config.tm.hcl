globals {
  environment = "sandbox"
  tenant = "money"

  google_region = "europe-west1"
  google_region_short = "euw1"


  vpc = {
    subnets = [
      {
        subnet_name   = "subnet1"
        subnet_region = "us-central1"
        subnet_ip     = "10.0.0.0/24"
      },
    ]
  }

}
