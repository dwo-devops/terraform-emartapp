terraform {
    backend "s3" {
      bucket = "terraform-state-emartapp"
      key = "terraform/backend"
      region = "us-east-1"
    }
}
