terraform {
  backend "gcs" {
    bucket = "dev-wif-demo-terraform-backend-bucket"
    prefix = "staging/us-east-1/tf-state"
  }
}
