terraform {
  backend "s3" {
    bucket = "terraform-state-11"
    key    = "terraform/backend"
    region = "us-east-2"
  }
}