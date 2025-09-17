terraform {
  backend "gcs" {
    bucket = "dev-wif-demo-terraform-backend-bucket"
    prefix = "prod/us-east-1/tf-state"
  }
}
