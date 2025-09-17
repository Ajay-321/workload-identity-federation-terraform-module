# provider "google" {
#   project     = var.project_id
#   region      = var.region
#   credentials = file("workload_identity_config.json")
#   impersonate_service_account = "terraform-wif-service-account@dev-wif-demo-project.iam.gserviceaccount.com"
# }

provider "google" {
  project = var.project_id
  region  = var.region
}
