terraform {
  backend "gcs" {
    bucket = "dev-wif-demo-terraform-backend-bucket"
    prefix = "dev/us-central1/tf-state"
  }
}
