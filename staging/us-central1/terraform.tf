# provider "google" {
#   project = var.project_id
#   region  = var.region
# }

# provider "google" {
#   alias = "impersonation"
#   scopes = [
#     "https://www.googleapis.com/auth/cloud-platform",
#     "https://www.googleapis.com/auth/userinfo.email",
#   ]
#   access_token    = data.google_service_account_access_token.default.access_token
#   request_timeout = "60s"
#   project         = var.project_id
#   region          = var.region
# }

# data "google_service_account_access_token" "default" {
#   provider               = google
#   target_service_account = var.terraform_service_account
#   scopes                 = ["userinfo-email", "cloud-platform"]
#   lifetime               = "1200s"
# }
#export GOOGLE_APPLICATION_CREDENTIALS = "key.json"
#GOOGLE_EXTERNAL_ACCOUNT_ALLOW_EXECUTABLES=1
provider "google" {
  project = var.project_id
  region  = var.region
}

